# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160216023027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advisors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "advisors", ["country_id"], name: "index_advisors_on_country_id", using: :btree

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "service_center_id"
    t.integer  "advisor_id"
    t.integer  "vehicle_id"
    t.integer  "appointment_type"
    t.datetime "start_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "appointments", ["advisor_id"], name: "index_appointments_on_advisor_id", using: :btree
  add_index "appointments", ["service_center_id"], name: "index_appointments_on_service_center_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree
  add_index "appointments", ["vehicle_id"], name: "index_appointments_on_vehicle_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "iso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_centers", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_centers", ["country_id"], name: "index_service_centers_on_country_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.integer  "country_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "auth_token"
    t.datetime "auth_token_expiration"
  end

  add_index "users", ["country_id"], name: "index_users_on_country_id", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "license_plate"
    t.string   "make"
    t.integer  "year"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "vehicles", ["user_id"], name: "index_vehicles_on_user_id", using: :btree

  add_foreign_key "advisors", "countries"
  add_foreign_key "appointments", "advisors"
  add_foreign_key "appointments", "service_centers"
  add_foreign_key "appointments", "users"
  add_foreign_key "appointments", "vehicles"
  add_foreign_key "service_centers", "countries"
  add_foreign_key "users", "countries"
  add_foreign_key "vehicles", "users"
end
