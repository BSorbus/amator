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

ActiveRecord::Schema.define(version: 20150630212654) do

  create_table "club_mf_devices", force: :cascade do |t|
    t.string   "department",        limit: 255
    t.string   "number",            limit: 255
    t.date     "date_of_issue"
    t.date     "valid_to"
    t.string   "call_sign",         limit: 255
    t.string   "category",          limit: 255
    t.integer  "transmitter_power", limit: 4
    t.string   "name_type_station", limit: 255
    t.string   "emission",          limit: 255
    t.string   "input_frequency",   limit: 255
    t.string   "output_frequency",  limit: 255
    t.string   "operator_1",        limit: 255
    t.string   "operator_2",        limit: 255
    t.string   "operator_3",        limit: 255
    t.string   "enduser_name",      limit: 255
    t.string   "enduser_city",      limit: 255
    t.string   "enduser_street",    limit: 255
    t.string   "enduser_house",     limit: 255
    t.string   "enduser_number",    limit: 255
    t.string   "applicant_name",    limit: 255
    t.string   "applicant_city",    limit: 255
    t.string   "applicant_street",  limit: 255
    t.string   "applicant_house",   limit: 255
    t.string   "applicant_number",  limit: 255
    t.string   "station_city",      limit: 255
    t.string   "station_street",    limit: 255
    t.string   "station_house",     limit: 255
    t.string   "station_number",    limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.float    "lat",               limit: 24
    t.float    "lng",               limit: 24
  end

  add_index "club_mf_devices", ["applicant_name"], name: "index_club_mf_devices_on_applicant_name", using: :btree
  add_index "club_mf_devices", ["call_sign"], name: "index_club_mf_devices_on_call_sign", using: :btree
  add_index "club_mf_devices", ["department"], name: "index_club_mf_devices_on_department", using: :btree
  add_index "club_mf_devices", ["enduser_name"], name: "index_club_mf_devices_on_enduser_name", using: :btree
  add_index "club_mf_devices", ["name_type_station"], name: "index_club_mf_devices_on_name_type_station", using: :btree
  add_index "club_mf_devices", ["number"], name: "index_club_mf_devices_on_number", using: :btree
  add_index "club_mf_devices", ["operator_1"], name: "index_club_mf_devices_on_operator_1", using: :btree
  add_index "club_mf_devices", ["operator_2"], name: "index_club_mf_devices_on_operator_2", using: :btree
  add_index "club_mf_devices", ["operator_3"], name: "index_club_mf_devices_on_operator_3", using: :btree
  add_index "club_mf_devices", ["station_city"], name: "index_club_mf_devices_on_station_city", using: :btree

  create_table "clubs", force: :cascade do |t|
    t.string   "department",        limit: 255
    t.string   "number",            limit: 255
    t.date     "date_of_issue"
    t.date     "valid_to"
    t.string   "call_sign",         limit: 255
    t.string   "category",          limit: 255
    t.integer  "transmitter_power", limit: 4
    t.string   "operator_1",        limit: 255
    t.string   "operator_2",        limit: 255
    t.string   "operator_3",        limit: 255
    t.string   "enduser_name",      limit: 255
    t.string   "enduser_city",      limit: 255
    t.string   "enduser_street",    limit: 255
    t.string   "enduser_house",     limit: 255
    t.string   "enduser_number",    limit: 255
    t.string   "applicant_name",    limit: 255
    t.string   "applicant_city",    limit: 255
    t.string   "applicant_street",  limit: 255
    t.string   "applicant_house",   limit: 255
    t.string   "applicant_number",  limit: 255
    t.string   "station_city",      limit: 255
    t.string   "station_street",    limit: 255
    t.string   "station_house",     limit: 255
    t.string   "station_number",    limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.float    "lat",               limit: 24
    t.float    "lng",               limit: 24
  end

  add_index "clubs", ["applicant_name"], name: "index_clubs_on_applicant_name", using: :btree
  add_index "clubs", ["call_sign"], name: "index_clubs_on_call_sign", using: :btree
  add_index "clubs", ["department"], name: "index_clubs_on_department", using: :btree
  add_index "clubs", ["enduser_name"], name: "index_clubs_on_enduser_name", using: :btree
  add_index "clubs", ["number"], name: "index_clubs_on_number", using: :btree
  add_index "clubs", ["operator_1"], name: "index_clubs_on_operator_1", using: :btree
  add_index "clubs", ["operator_2"], name: "index_clubs_on_operator_2", using: :btree
  add_index "clubs", ["operator_3"], name: "index_clubs_on_operator_3", using: :btree
  add_index "clubs", ["station_city"], name: "index_clubs_on_station_city", using: :btree

  create_table "individual_mf_devices", force: :cascade do |t|
    t.string   "department",        limit: 255
    t.string   "number",            limit: 255
    t.date     "date_of_issue"
    t.date     "valid_to"
    t.string   "call_sign",         limit: 255
    t.string   "category",          limit: 255
    t.integer  "transmitter_power", limit: 4
    t.string   "name_type_station", limit: 255
    t.string   "emission",          limit: 255
    t.string   "input_frequency",   limit: 255
    t.string   "output_frequency",  limit: 255
    t.string   "operator_1",        limit: 255
    t.string   "operator_2",        limit: 255
    t.string   "operator_3",        limit: 255
    t.string   "station_location",  limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "individual_mf_devices", ["call_sign"], name: "index_individual_mf_devices_on_call_sign", using: :btree
  add_index "individual_mf_devices", ["department"], name: "index_individual_mf_devices_on_department", using: :btree
  add_index "individual_mf_devices", ["name_type_station"], name: "index_individual_mf_devices_on_name_type_station", using: :btree
  add_index "individual_mf_devices", ["number"], name: "index_individual_mf_devices_on_number", using: :btree
  add_index "individual_mf_devices", ["operator_1"], name: "index_individual_mf_devices_on_operator_1", using: :btree
  add_index "individual_mf_devices", ["operator_2"], name: "index_individual_mf_devices_on_operator_2", using: :btree
  add_index "individual_mf_devices", ["operator_3"], name: "index_individual_mf_devices_on_operator_3", using: :btree
  add_index "individual_mf_devices", ["station_location"], name: "index_individual_mf_devices_on_station_location", using: :btree

  create_table "individuals", force: :cascade do |t|
    t.string   "department",        limit: 255
    t.string   "number",            limit: 255
    t.date     "date_of_issue"
    t.date     "valid_to"
    t.string   "call_sign",         limit: 255
    t.string   "category",          limit: 255
    t.integer  "transmitter_power", limit: 4
    t.string   "station_location",  limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "individuals", ["call_sign"], name: "index_individuals_on_call_sign", using: :btree
  add_index "individuals", ["department"], name: "index_individuals_on_department", using: :btree
  add_index "individuals", ["number"], name: "index_individuals_on_number", using: :btree
  add_index "individuals", ["station_location"], name: "index_individuals_on_station_location", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
