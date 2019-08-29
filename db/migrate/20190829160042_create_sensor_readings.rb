class CreateSensorReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :sensor_readings do |t|
      t.decimal :temperature, precision: 4, scale: 2, default: 30.0
      t.integer :humidity, null: false, default: 60
      t.integer :carbon_monoxide, null: false, default: 1
      t.string :status, null: false, default: 'ok', limit: 150
      t.datetime :read_at, null: false

      t.timestamps
    end
  end
end
