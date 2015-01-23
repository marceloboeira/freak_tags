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

ActiveRecord::Schema.define(version: 20150121023927) do

  create_table "friendships", force: :cascade do |t|
    t.integer "friendable_id"
    t.integer "friend_id"
    t.integer "blocker_id"
    t.boolean "pending",       default: true
  end

  add_index "friendships", ["friendable_id", "friend_id"], name: "index_friendships_on_friendable_id_and_friend_id", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "username",                        null: false
    t.string   "email",                           null: false
    t.string   "gender",      default: "other",   null: false
    t.string   "role",        default: "regular", null: false
    t.text     "description"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
