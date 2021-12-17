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

ActiveRecord::Schema.define(version: 20211217104336) do

  create_table "deals", force: :cascade do |t|
    t.string   "deals_name",  limit: 255
    t.integer  "products_id", limit: 4
    t.integer  "item_qty",    limit: 4
    t.integer  "offer_price", limit: 8
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "is_active",               default: false
  end

  create_table "deals_user_mappings", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "deal_id",    limit: 4
    t.boolean  "is_applied",           default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "sku",        limit: 255
    t.string   "quantity",   limit: 255
    t.integer  "price",      limit: 8
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "mobile",     limit: 20
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
