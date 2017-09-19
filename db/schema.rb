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

ActiveRecord::Schema.define(version: 20170327215717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "club_mf_devices", force: :cascade do |t|
    t.string   "number"
    t.date     "date_of_issue"
    t.date     "valid_to"
    t.string   "call_sign"
    t.string   "category"
    t.integer  "transmitter_power"
    t.string   "name_type_station"
    t.string   "emission"
    t.string   "input_frequency"
    t.string   "output_frequency"
    t.string   "enduser_name"
    t.string   "enduser_city"
    t.string   "enduser_street"
    t.string   "enduser_house"
    t.string   "enduser_number"
    t.string   "applicant_name"
    t.string   "applicant_city"
    t.string   "applicant_street"
    t.string   "applicant_house"
    t.string   "applicant_number"
    t.string   "station_city"
    t.string   "station_street"
    t.string   "station_house"
    t.string   "station_number"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.float    "lat"
    t.float    "lng"
  end

  add_index "club_mf_devices", ["applicant_name"], name: "index_club_mf_devices_on_applicant_name", using: :btree
  add_index "club_mf_devices", ["call_sign"], name: "index_club_mf_devices_on_call_sign", using: :btree
  add_index "club_mf_devices", ["enduser_name"], name: "index_club_mf_devices_on_enduser_name", using: :btree
  add_index "club_mf_devices", ["name_type_station"], name: "index_club_mf_devices_on_name_type_station", using: :btree
  add_index "club_mf_devices", ["number"], name: "index_club_mf_devices_on_number", using: :btree
  add_index "club_mf_devices", ["station_city"], name: "index_club_mf_devices_on_station_city", using: :btree

  create_table "clubs", force: :cascade do |t|
    t.string   "number"
    t.date     "date_of_issue"
    t.date     "valid_to"
    t.string   "call_sign"
    t.string   "category"
    t.integer  "transmitter_power"
    t.string   "enduser_name"
    t.string   "enduser_city"
    t.string   "enduser_street"
    t.string   "enduser_house"
    t.string   "enduser_number"
    t.string   "applicant_name"
    t.string   "applicant_city"
    t.string   "applicant_street"
    t.string   "applicant_house"
    t.string   "applicant_number"
    t.string   "station_city"
    t.string   "station_street"
    t.string   "station_house"
    t.string   "station_number"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.float    "lat"
    t.float    "lng"
  end

  add_index "clubs", ["applicant_name"], name: "index_clubs_on_applicant_name", using: :btree
  add_index "clubs", ["call_sign"], name: "index_clubs_on_call_sign", using: :btree
  add_index "clubs", ["enduser_name"], name: "index_clubs_on_enduser_name", using: :btree
  add_index "clubs", ["number"], name: "index_clubs_on_number", using: :btree
  add_index "clubs", ["station_city"], name: "index_clubs_on_station_city", using: :btree

  create_table "individual_mf_devices", force: :cascade do |t|
    t.string   "number"
    t.date     "date_of_issue"
    t.date     "valid_to"
    t.string   "call_sign"
    t.string   "category"
    t.integer  "transmitter_power"
    t.string   "name_type_station"
    t.string   "emission"
    t.string   "input_frequency"
    t.string   "output_frequency"
    t.string   "station_location"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "individual_mf_devices", ["call_sign"], name: "index_individual_mf_devices_on_call_sign", using: :btree
  add_index "individual_mf_devices", ["name_type_station"], name: "index_individual_mf_devices_on_name_type_station", using: :btree
  add_index "individual_mf_devices", ["number"], name: "index_individual_mf_devices_on_number", using: :btree
  add_index "individual_mf_devices", ["station_location"], name: "index_individual_mf_devices_on_station_location", using: :btree

  create_table "individuals", force: :cascade do |t|
    t.string   "number",            limit: 160, default: "", null: false
    t.date     "date_of_issue"
    t.date     "valid_to"
    t.string   "call_sign",         limit: 50,  default: "", null: false
    t.string   "category",          limit: 50,  default: "", null: false
    t.integer  "transmitter_power"
    t.string   "station_location",  limit: 160, default: "", null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "individuals", ["call_sign"], name: "index_individuals_on_call_sign", using: :btree
  add_index "individuals", ["number"], name: "index_individuals_on_number", using: :btree
  add_index "individuals", ["station_location"], name: "index_individuals_on_station_location", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
