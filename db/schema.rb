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

ActiveRecord::Schema.define(version: 20140822151544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_receipts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "provider_id"
    t.integer  "counseling_session_id"
    t.integer  "session_duration"
    t.decimal  "amount_charged"
  end

  add_index "client_receipts", ["client_id"], name: "index_client_receipts_on_client_id", using: :btree
  add_index "client_receipts", ["counseling_session_id"], name: "index_client_receipts_on_counseling_session_id", using: :btree
  add_index "client_receipts", ["provider_id"], name: "index_client_receipts_on_provider_id", using: :btree

  create_table "clients", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "zip"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.string   "alt_phone"
    t.string   "status"
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "counseling_sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "provider_id"
    t.boolean  "in_progress"
    t.datetime "ended_at"
    t.boolean  "is_created"
    t.boolean  "provider_joined"
    t.integer  "session_type"
    t.boolean  "session_ended"
    t.datetime "started_at"
    t.decimal  "adv_amount"
    t.string   "adv_units"
    t.decimal  "total_amount"
    t.boolean  "alt_time_specified"
    t.integer  "alt_time"
    t.integer  "session_duration"
    t.boolean  "charges_settled"
  end

  add_index "counseling_sessions", ["client_id"], name: "index_counseling_sessions_on_client_id", using: :btree
  add_index "counseling_sessions", ["provider_id"], name: "index_counseling_sessions_on_provider_id", using: :btree

  create_table "entries", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "provider_id"
    t.integer  "counseling_session_id"
    t.text     "entry_text"
    t.boolean  "entry_by_client"
    t.boolean  "entry_by_provider"
    t.boolean  "answered"
  end

  add_index "entries", ["client_id"], name: "index_entries_on_client_id", using: :btree
  add_index "entries", ["counseling_session_id"], name: "index_entries_on_counseling_session_id", using: :btree
  add_index "entries", ["provider_id"], name: "index_entries_on_provider_id", using: :btree

  create_table "funds", force: true do |t|
    t.integer  "client_id"
    t.string   "stripe_customer_token"
    t.decimal  "avail_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "funds_on_hold"
  end

  add_index "funds", ["client_id"], name: "index_funds_on_client_id", using: :btree

  create_table "payments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fund_id"
    t.decimal  "amount"
    t.string   "charge_token"
  end

  add_index "payments", ["fund_id"], name: "index_payments_on_fund_id", using: :btree

  create_table "proceeds", force: true do |t|
    t.integer  "provider_id"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "paid_to_provider"
    t.integer  "counseling_session_id"
  end

  add_index "proceeds", ["counseling_session_id"], name: "index_proceeds_on_counseling_session_id", using: :btree
  add_index "proceeds", ["provider_id"], name: "index_proceeds_on_provider_id", using: :btree

  create_table "provider_alerts", force: true do |t|
    t.text     "alert_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "answered"
    t.integer  "client_id"
    t.integer  "provider_id"
    t.string   "alert_subject"
    t.integer  "counseling_session_id"
    t.integer  "alert_type"
  end

  add_index "provider_alerts", ["client_id"], name: "index_provider_alerts_on_client_id", using: :btree
  add_index "provider_alerts", ["counseling_session_id"], name: "index_provider_alerts_on_counseling_session_id", using: :btree
  add_index "provider_alerts", ["provider_id"], name: "index_provider_alerts_on_provider_id", using: :btree

  create_table "provider_funds", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "provider_id"
    t.decimal  "avail_amount"
  end

  add_index "provider_funds", ["provider_id"], name: "index_provider_funds_on_provider_id", using: :btree

  create_table "providers", force: true do |t|
    t.string   "email",                                          default: "", null: false
    t.string   "encrypted_password",                             default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "zip"
    t.binary   "profile_image"
    t.string   "filename"
    t.string   "content_type"
    t.string   "unit"
    t.text     "summary"
    t.string   "honorific"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.string   "alt_phone"
    t.boolean  "service_by_phone"
    t.boolean  "service_by_chat"
    t.boolean  "service_by_email"
    t.boolean  "public"
    t.integer  "status"
    t.decimal  "rate",                   precision: 8, scale: 2
  end

  add_index "providers", ["email"], name: "index_providers_on_email", unique: true, using: :btree
  add_index "providers", ["reset_password_token"], name: "index_providers_on_reset_password_token", unique: true, using: :btree

  create_table "reviews", force: true do |t|
    t.integer  "provider_id"
    t.integer  "rating"
    t.integer  "client_id"
    t.text     "review"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "heading"
  end

  add_index "reviews", ["client_id"], name: "index_reviews_on_user_id", using: :btree
  add_index "reviews", ["provider_id"], name: "index_reviews_on_provider_id", using: :btree

  create_table "site_funds", force: true do |t|
    t.decimal  "avail_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_proceeds", force: true do |t|
    t.integer  "client_id"
    t.integer  "provider_id"
    t.integer  "counseling_session_id"
    t.decimal  "total_session_amount"
    t.decimal  "provider_amount"
    t.decimal  "commission_amount"
    t.decimal  "commission_percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_proceeds", ["client_id"], name: "index_site_proceeds_on_client_id", using: :btree
  add_index "site_proceeds", ["counseling_session_id"], name: "index_site_proceeds_on_counseling_session_id", using: :btree
  add_index "site_proceeds", ["provider_id"], name: "index_site_proceeds_on_provider_id", using: :btree

  create_table "sites", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "phone"
    t.string   "alt_phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
  end

  add_index "sites", ["email"], name: "index_sites_on_email", unique: true, using: :btree
  add_index "sites", ["reset_password_token"], name: "index_sites_on_reset_password_token", unique: true, using: :btree

end
