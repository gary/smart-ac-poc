# frozen_string_literal: true

# TODO: Document public API
# :nodoc:
class Devices < Grape::API
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
  end
end
