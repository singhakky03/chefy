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

ActiveRecord::Schema.define(version: 20170827100249) do

  create_table "delivery_boys", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "contact",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "food_items", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "price",       limit: 4
    t.string   "chef",        limit: 255
    t.integer  "rating",      limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "status",      limit: 1
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "food_item_id", limit: 4
    t.integer  "order_id",     limit: 4
    t.decimal  "unit_price",             precision: 12, scale: 3
    t.integer  "quantity",     limit: 4
    t.decimal  "total_price",            precision: 12, scale: 3
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "order_items", ["food_item_id"], name: "index_order_items_on_food_item_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",                  precision: 12, scale: 3
    t.decimal  "tax",                       precision: 12, scale: 3
    t.decimal  "shipping",                  precision: 12, scale: 3
    t.decimal  "total",                     precision: 12, scale: 3
    t.integer  "order_status_id", limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "delivery_boy_id", limit: 4
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree

  create_table "time_slots", force: :cascade do |t|
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "food_item_id", limit: 4
  end

  add_index "time_slots", ["food_item_id"], name: "index_time_slots_on_food_item_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "order_items", "food_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "order_statuses"
end
