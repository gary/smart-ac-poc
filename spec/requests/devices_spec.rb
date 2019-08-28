# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Devices do
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
