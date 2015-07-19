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

ActiveRecord::Schema.define(version: 20141212042248) do

  create_table "authorizations", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliverables", force: true do |t|
    t.integer  "driver_id",                         null: false
    t.integer  "product_id",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gram_quantity",         default: 0
    t.integer  "eight_ounce_quantity",  default: 0
    t.integer  "fourth_ounce_quantity", default: 0
    t.integer  "half_ounce_quantity",   default: 0
    t.integer  "ounce_quantity"
  end

  add_index "deliverables", ["driver_id"], name: "index_deliverables_on_driver_id"
  add_index "deliverables", ["product_id"], name: "index_deliverables_on_product_id"

  create_table "drivers", force: true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hub_id"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "estimated_last_delivery_time", limit: 255
    t.float    "total_cash",                               default: 0.0
    t.boolean  "is_delivering",                            default: false
  end

  add_index "drivers", ["hub_id"], name: "index_drivers_on_hub_id"

  create_table "hubs", force: true do |t|
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "longitude"
    t.float    "latitude"
  end

  create_table "invoices", force: true do |t|
    t.integer  "product_id",                                      null: false
    t.float    "price",                                           null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "completed",                       default: false
    t.integer  "driver_id"
    t.string   "payment_type"
    t.integer  "user_id"
    t.integer  "estimated_delivery_time_minutes"
    t.integer  "order_id"
    t.string   "quantity_type"
    t.integer  "quantity"
  end

  add_index "invoices", ["product_id"], name: "index_invoices_on_product_id"
  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id"

  create_table "payments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pickables", force: true do |t|
    t.integer  "hub_id",                 null: false
    t.integer  "product_id",             null: false
    t.integer  "quantity",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pickables", ["hub_id"], name: "index_pickables_on_hub_id"
  add_index "pickables", ["product_id"], name: "index_pickables_on_product_id"

  create_table "products", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "product_description"
    t.string   "gram_price",                          null: false
    t.boolean  "delivering_today",    default: false
    t.string   "pic_url"
    t.string   "eight_ounce_price"
    t.string   "fourth_ounce_price"
    t.string   "half_ounce_price"
    t.float    "thc"
    t.integer  "ounce_price"
  end

  add_index "products", ["delivering_today"], name: "index_products_on_delivering_today"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
