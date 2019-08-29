class AddDeviceRefToSensorReadings < ActiveRecord::Migration[6.0]
  def change
    change_table :sensor_readings do |t|
      t.references :device, null: false, foreign_key: true
    end
  end
end
