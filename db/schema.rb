# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100906160248) do

  create_table "friends", :force => true do |t|
    t.integer  "request_sender_id"
    t.integer  "request_receiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", :force => true do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.string   "pay_type"
    t.date     "purchase_date"
    t.date     "real_travel_date"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trip_features", :force => true do |t|
    t.integer  "trip_id"
    t.string   "kind"
    t.string   "slug"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "image_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "tag_line"
    t.integer  "price",       :default => 0
    t.string   "location"
    t.string   "activity"
  end

  create_table "user_preferences", :force => true do |t|
    t.integer  "user_id"
    t.string   "kind"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

end
