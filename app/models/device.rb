# frozen_string_literal: true

# Represents a smart Air Conditioner
class Device < ApplicationRecord
  has_many :sensor_readings, dependent: :destroy
end
