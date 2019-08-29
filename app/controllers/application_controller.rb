# frozen_string_literal: true

# :nodoc:
class ApplicationController < ActionController::Base
  before_action :authenticate_account!
end
