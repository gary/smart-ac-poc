# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Devices do
  describe 'GET /api/devices/' do
    before do
      %w[1 2].each do |index|
        Device.create!(serial_number: index,
                       registered_at: DateTime.current,
                       firmware_version: index)
      end
    end

    it 'lists all devices' do
      get('/api/devices')

      expect(JSON.parse(response.body))
        .to contain_exactly(a_kind_of(Hash), a_kind_of(Hash))
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /api/devices/register' do
    it 'creates a new device' do
      post('/api/devices/register', params: {
             serial_number: '1',
             registered_at: '2019-08-28',
             firmware_version: '0'
           })

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:created)
    end
  end
end
