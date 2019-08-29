# frozen_string_literal: true

# Represents a reading from a {Device}'s sensors
class SensorReading < ApplicationRecord
  belongs_to :device
end
