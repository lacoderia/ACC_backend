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

ActiveRecord::Schema.define(version: 20150423220615) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "agreements", force: true do |t|
    t.integer  "agreement_no"
    t.string   "name"
    t.string   "mail_domain"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "insurance_leads", force: true do |t|
    t.string   "first_name"
    t.string   "last_name_f"
    t.string   "last_name_m"
    t.string   "phone_number"
    t.string   "email"
    t.string   "insurance_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "other_type"
  end

  create_table "insurance_prices", force: true do |t|
    t.string   "vehicle_type"
    t.string   "size"
    t.string   "age_old"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leads", force: true do |t|
    t.string   "document_type"
    t.string   "document_id"
    t.string   "first_name"
    t.string   "last_name_f"
    t.string   "last_name_m"
    t.string   "phone_number"
    t.string   "email"
    t.string   "plate_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_types", force: true do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "long"
    t.integer  "location_type_id"
    t.string   "address"
    t.string   "phone"
    t.text     "description",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "perk_id"
  end

  create_table "perks", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "process_leads", force: true do |t|
    t.string   "first_name"
    t.string   "last_name_f"
    t.string   "last_name_m"
    t.string   "phone_number"
    t.string   "email"
    t.string   "process_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "other_type"
  end

  create_table "rides", force: true do |t|
    t.integer  "agreement_id"
    t.integer  "user_id"
    t.datetime "ride_when"
    t.text     "origin"
    t.text     "destination"
    t.float    "cost"
    t.integer  "seats"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rides_users", id: false, force: true do |t|
    t.integer "ride_id"
    t.integer "user_id"
  end

  create_table "roadside_assistances", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "plate_number"
    t.string   "assistance_type"
    t.float    "lat"
    t.float    "long"
    t.boolean  "is_guest"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "solved",          default: false
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "document_type"
    t.string   "document_id"
    t.boolean  "is_member"
    t.integer  "agreement_id"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "authentication_token"
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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["document_id", "document_type"], name: "index_users_on_document_id_and_document_type", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_vehicles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "vehicle_id"
  end

  create_table "vehicles", force: true do |t|
    t.string   "plate_number"
    t.string   "brand"
    t.string   "model"
    t.datetime "soat_date"
    t.string   "document_type_owner"
    t.string   "document_id_owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicles", ["plate_number"], name: "index_vehicles_on_plate_number", unique: true

end
