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

ActiveRecord::Schema.define(version: 2021_07_13_133018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "staff_messages", force: :cascade do |t|
    t.bigint "recipient_id"
    t.date "seen_on"
    t.text "body"
    t.bigint "sender_id"
    t.bigint "parent_id"
    t.bigint "thread_parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_staff_messages_on_parent_id"
    t.index ["recipient_id"], name: "index_staff_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_staff_messages_on_sender_id"
    t.index ["thread_parent_id"], name: "index_staff_messages_on_thread_parent_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "staff_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "staff_messages", "staff_messages", column: "parent_id"
  add_foreign_key "staff_messages", "staff_messages", column: "thread_parent_id"
  add_foreign_key "staff_messages", "staffs", column: "recipient_id"
  add_foreign_key "staff_messages", "staffs", column: "sender_id"
end
