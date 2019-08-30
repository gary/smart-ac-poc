class DevicesController < ApplicationController
  def index
    redirect_to url_for('/api/devices')
  end
end
