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

ActiveRecord::Schema.define(version: 20150723230659) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street_num_name", null: false
    t.string   "city",            null: false
    t.string   "state",           null: false
    t.string   "zip",             null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "address_id"
    t.integer  "payment_id"
    t.datetime "order_date"
  end

  create_table "payments", force: :cascade do |t|
    t.string  "cc_number"
    t.string  "name_on_cc"
    t.string  "exp_date"
    t.integer "user_id"
    t.integer "billing_address_id"
  end

  create_table "products", force: :cascade do |t|
    t.decimal  "price",       precision: 6, scale: 2
    t.string   "name",                                null: false
    t.string   "description"
    t.integer  "category_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "products_orders", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "quantity"
  end

  create_table "user_addresses", force: :cascade do |t|
    t.integer "address_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              null: false
    t.string   "first_name",         null: false
    t.string   "last_name",          null: false
    t.string   "phone"
    t.integer  "primary_address_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
