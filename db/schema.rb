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

ActiveRecord::Schema.define(version: 20170714164417) do

  create_table "auction_news", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "vehicle_desc"
    t.string "vehicle_vin"
    t.decimal "winning_bid", precision: 8, scale: 2
    t.decimal "seller_payout", precision: 8, scale: 2
    t.decimal "profit", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auctions", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "vehicle_desc"
    t.string "vehicle_vin"
    t.decimal "winning_bid", precision: 8, scale: 2
    t.decimal "seller_payout", precision: 8, scale: 2
    t.decimal "profit", precision: 8, scale: 2
  end

  create_table "submissions", force: :cascade do |t|
    t.string "csv_file_file_name"
    t.string "csv_file_content_type"
    t.integer "csv_file_file_size"
    t.datetime "csv_file_updated_at"
  end

end
