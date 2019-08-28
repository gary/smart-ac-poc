# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Devices do
  describe 'GET /devices' do
    it 'returns an HTTP 200' do
      get '/devices'

      expect(response.status).to eq(200)
    end
  end
end
