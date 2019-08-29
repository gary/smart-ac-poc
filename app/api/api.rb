# frozen_string_literal: true

# TODO: Document public API
# :nodoc:
class API < Grape::API
  format :json
  prefix :api

  resource :devices do
    get '/' do
      Device.all
    end

    params do
      requires :serial_number, type: String, desc: 'Serial number'
      optional :registered_at, type: DateTime, desc: 'Registration date'
      requires :firmware_version, type: String, desc: 'Firmware version'
    end
    post '/register' do
      Device.create!(serial_number: params[:serial_number],
                     registered_at: params[:registered_at],
                     firmware_version: params[:firmware_version])
    end

    route_param :device_id do
      before do
        @device = Device.find(params[:device_id])
      end

      resources 'sensor-readings' do
        params do
          optional :start, type: DateTime
        end
        get '/' do
          if params.key?(:start)
            @device.sensor_readings.where('read_at >= ?', params[:start])
          else
            @device.sensor_readings
          end
        end

        params do
          requires :sensor_readings, type: Array do
            # TODO: Better validate input
          end
        end
        post '/' do
          @device.sensor_readings.create!(params[:sensor_readings])
        end
      end
    end
  end
end
