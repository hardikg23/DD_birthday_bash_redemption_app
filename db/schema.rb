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

ActiveRecord::Schema.define(version: 20151008055737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gold_coin_surveys", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "city"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "question_1"
    t.string   "question_2"
    t.string   "question_3"
    t.string   "question_3_input"
    t.string   "question_4"
    t.string   "question_5"
    t.string   "question_5_input"
    t.string   "question_6"
    t.string   "question_7"
    t.string   "question_7_input"
    t.string   "question_8"
    t.string   "question_9"
    t.string   "question_10"
    t.string   "question_11"
    t.string   "question_12",                    array: true
    t.string   "question_13"
    t.string   "question_13_input"
    t.string   "question_14"
    t.string   "question_15",                    array: true
    t.string   "question_15_input"
    t.string   "question_16"
    t.string   "question_16_input"
    t.string   "question_17"
    t.string   "question_17_input"
    t.string   "question_18"
    t.string   "question_18_input"
    t.string   "question_19"
    t.string   "question_20"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "redemptions", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.text     "address"
    t.string   "pin_code"
    t.string   "contact_number"
    t.string   "redemption_type"
    t.string   "t_shirt_size"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
