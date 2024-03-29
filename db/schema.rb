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

ActiveRecord::Schema.define(version: 20151024193215) do

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "email",                                          default: "",       null: false
    t.string   "encrypted_password",                             default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.integer  "age"
    t.decimal  "height",                 precision: 5, scale: 2
    t.decimal  "weight",                 precision: 5, scale: 2
    t.string   "type_of_height",                                 default: "inches"
    t.string   "type_of_weight",                                 default: "lbs"
    t.decimal  "neck",                   precision: 3, scale: 1
    t.decimal  "bust",                   precision: 3, scale: 1
    t.decimal  "waist",                  precision: 3, scale: 1
    t.string   "welcome_step"
    t.decimal  "chest",                  precision: 3, scale: 1
    t.decimal  "sleeves",                precision: 3, scale: 1
    t.decimal  "hips",                   precision: 3, scale: 1
    t.decimal  "inside_legs",            precision: 3, scale: 1
    t.decimal  "feet",                   precision: 3, scale: 1
    t.string   "fit"
    t.integer  "body_shape"
    t.text     "brands"
    t.string   "registration_token"
    t.string   "provider"
    t.string   "uid"
    t.string   "other_brands"
    t.string   "full_name"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
