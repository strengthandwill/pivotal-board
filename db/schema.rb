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

ActiveRecord::Schema.define(version: 20150804000406) do

  create_table "burndowns", force: :cascade do |t|
    t.string   "team"
    t.date     "date"
    t.integer  "unstarted"
    t.integer  "started"
    t.integer  "finished"
    t.integer  "delivered"
    t.integer  "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "impeded"
  end

  create_table "colors", force: :cascade do |t|
    t.string   "unstarted"
    t.string   "started"
    t.string   "finished"
    t.string   "delivered"
    t.string   "impeded"
    t.string   "accepted"
    t.string   "feature"
    t.string   "chore"
    t.string   "bug"
    t.string   "retro"
    t.string   "rejected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "username"
    t.string   "name"
    t.string   "image_path"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
  end

  add_index "people", ["email"], name: "index_people_on_email", unique: true
  add_index "people", ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true
  add_index "people", ["username"], name: "index_people_on_username", unique: true

end
