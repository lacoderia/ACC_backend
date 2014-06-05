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

ActiveRecord::Schema.define(version: 20140604222457) do

  create_table "agreements", force: true do |t|
    t.integer  "agreement_no"
    t.string   "name"
    t.string   "logo"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rides", force: true do |t|
    t.integer  "agreement_id"
    t.integer  "user_id"
    t.datetime "when"
    t.text     "origin"
    t.text     "destination"
    t.float    "cost"
    t.integer  "seats"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "document_type"
    t.string   "document_id"
    t.boolean  "is_member"
    t.integer  "agreement_id"
    t.string   "phone_number"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", force: true do |t|
    t.integer  "user_id"
    t.string   "plate_number"
    t.string   "brand"
    t.string   "model"
    t.datetime "soat_date"
    t.datetime "poliza_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
