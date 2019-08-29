# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API do
  def device_params(**params)
    {
      serial_number: params.fetch(:serial_number, '1'),
      registered_at: params.fetch(:registered_at, DateTime.current),
      firmware_version: params.fetch(:firmware_version, '0')
    }
  end

  def create_device(params: device_params)
    Device.create!(params)
  end

  context '/api/devices' do
    describe 'GET /' do
      before do
        %w[1 2].each do |index|
          create_device(params:
                        { serial_number: index, firmware_version: index })
        end
      end

      it 'lists all devices' do
        get('/api/devices')

        expect(JSON.parse(response.body))
          .to contain_exactly(a_kind_of(Hash), a_kind_of(Hash))
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'POST /register' do
      it 'creates a new device' do
        post('/api/devices/register', params:
             {
               serial_number: '1',
               registered_at: '2019-08-28',
               firmware_version: '0'
             })

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:created)
      end
    end

    def sensor_reading_params(**params)
      {
        temperature: params.fetch(:temperature, 30.0),
        humidity: params.fetch(:humidity, 60),
        carbon_monoxide: params.fetch(:carbon_monoxide, 1),
        status: params.fetch(:status, 'ok'),
        read_at: params.fetch(:read_at, DateTime.current)
      }
    end

    context '/:device_id/sensor-readings' do
      let(:device) { create_device }

      describe 'POST /' do
        let(:sensor_readings) do
          [
            sensor_reading_params(status: 'needs_service'),
            sensor_reading_params(status: 'gas_leak'),
            sensor_reading_params
          ]
        end

        it 'creates new sensor readings in bulk' do
          post("/api/devices/#{device.id}/sensor-readings",
               params: {
                 sensor_readings: sensor_readings
               })

          expect(response.content_type).to eq('application/json')
          expect(response).to have_http_status(:created)
        end
      end

      describe 'GET /api/devices/:device_id/sensor-readings' do
        before do
          device.sensor_readings.build(
            sensor_reading_params(read_at: DateTime.parse('2019-08-01'))
          )
          device.sensor_readings.build(
            sensor_reading_params(read_at: DateTime.parse('2019-08-15'))
          )
          device.sensor_readings.build(sensor_reading_params)
          device.save!
        end

        context 'with no parameters' do
          it 'lists all sensor readings for the device' do
            get("/api/devices/#{device.id}/sensor-readings")

            expect(JSON.parse(response.body))
              .to contain_exactly(a_kind_of(Hash),
                                  a_kind_of(Hash),
                                  a_kind_of(Hash))
            expect(response).to have_http_status(:ok)
          end

          context 'with a start timestamp' do
            it 'lists all sensor readings read on or after the timestamp' do
              get("/api/devices/#{device.id}/sensor-readings",
                  params: {
                    start: '2019-08-15'
                  })

              expect(JSON.parse(response.body))
                .to contain_exactly(a_kind_of(Hash), a_kind_of(Hash))
              expect(response).to have_http_status(:ok)
            end
          end
        end
      end
    end
  end
end
