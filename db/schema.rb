# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_29_213320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "devices", force: :cascade do |t|
    t.string "serial_number", null: false
    t.datetime "registered_at", default: "2019-08-29 17:52:20", null: false
    t.string "firmware_version", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sensor_readings", force: :cascade do |t|
    t.decimal "temperature", precision: 4, scale: 2, default: "30.0"
    t.integer "humidity", default: 60, null: false
    t.integer "carbon_monoxide", default: 1, null: false
    t.string "status", limit: 150, default: "ok", null: false
    t.datetime "read_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "device_id", null: false
    t.index ["device_id"], name: "index_sensor_readings_on_device_id"
  end

  add_foreign_key "sensor_readings", "devices"
end
