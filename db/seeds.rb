# frozen_string_literal: true

# This file should contain all the record creation needed to seed the
# database with its default values.
# The data can then be loaded with the rails db:seed command (or
# created alongside the database with db:setup).

d = Device.create(serial_number: '1',
                  registered_at: DateTime.current,
                  firmware_version: '0')
d.sensor_readings.create!(read_at: DateTime.current)
