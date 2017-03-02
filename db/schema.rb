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

ActiveRecord::Schema.define(version: 20170302075251) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "path"
    t.string   "project_name"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "project_ids"
  end

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
    t.integer  "project_id"
  end

  create_table "migrations", force: :cascade do |t|
    t.string   "account"
    t.string   "name"
    t.string   "path"
    t.integer  "project_id"
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
    t.string   "image"
  end

  add_index "people", ["email"], name: "index_people_on_email", unique: true
  add_index "people", ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true
  add_index "people", ["username"], name: "index_people_on_username", unique: true

  create_table "settings", force: :cascade do |t|
    t.string   "unstarted_color"
    t.string   "started_color"
    t.string   "finished_color"
    t.string   "delivered_color"
    t.string   "impeded_color"
    t.string   "accepted_color"
    t.string   "feature_color"
    t.string   "chore_color"
    t.string   "bug_color"
    t.string   "retro_color"
    t.integer  "interval"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "sprint_goal_bahamut"
    t.string   "sprint_goal_omega"
    t.string   "sprint_goal_challenger"
    t.string   "sprint_goal_constellation"
  end

end
