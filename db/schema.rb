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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121228091102) do

  create_table "foods", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "foods_meals", :force => true do |t|
    t.integer  "food_id"
    t.integer  "meal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "temperature"
    t.datetime "consumed"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "meal_type"
    t.string   "feci"
    t.integer  "bloodpressuremin"
    t.integer  "bloodpressuremax"
  end

  create_table "meals_medicines", :force => true do |t|
    t.integer  "meal_id"
    t.integer  "medicine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meals_symptons", :force => true do |t|
    t.integer  "meal_id"
    t.integer  "sympton_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicines", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.float    "power"
  end

  create_table "symptons", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "gravity"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "username"
  end

end
