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

ActiveRecord::Schema.define(version: 20140814022446) do

  create_table "orders", force: true do |t|
    t.date     "create_date"
    t.string   "firts_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "email"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.date     "dob"
    t.integer  "cc"
    t.integer  "routing"
    t.string   "product"
    t.integer  "qty"
    t.decimal  "price"
    t.integer  "shipping_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "exp_year"
    t.integer  "exp_month"
    t.boolean  "is_reported"
    t.integer  "cvv"
    t.string   "phone"
    t.text     "billing_address"
    t.text     "comments"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "reports", force: true do |t|
    t.date     "date_report"
    t.integer  "status"
    t.string   "descriptor"
    t.integer  "payment"
    t.integer  "delivery"
    t.integer  "settled"
    t.decimal  "commission",      precision: 6, scale: 2
    t.string   "account_dest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.integer  "id_user"
    t.string   "tracking_number"
  end

  add_index "reports", ["order_id"], name: "index_reports_on_order_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "is_admin"
    t.boolean  "is_god"
    t.string   "phone"
    t.string   "country"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
