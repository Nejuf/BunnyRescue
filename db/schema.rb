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

ActiveRecord::Schema.define(version: 20140116190110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bunnies", force: true do |t|
    t.string   "name",       limit: 30,                                         null: false
    t.string   "status",                default: "unknown"
    t.integer  "age",                   default: 0
    t.text     "desc",                  default: "Soft and fluffy, of course!"
    t.string   "temperment",            default: "unknown"
    t.integer  "owner_id"
    t.string   "gender",                default: "unknown"
    t.boolean  "fixed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bunnies", ["name"], name: "index_bunnies_on_name", using: :btree
  add_index "bunnies", ["owner_id"], name: "index_bunnies_on_owner_id", using: :btree
  add_index "bunnies", ["status"], name: "index_bunnies_on_status", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            limit: 30, null: false
    t.string   "password_digest",            null: false
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
