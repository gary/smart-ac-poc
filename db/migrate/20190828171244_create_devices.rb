class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :serial_number, null: false
      t.datetime :registered_at, null: false, default: DateTime.current
      t.string :firmware_version, null: false

      t.timestamps
    end
  end
end
