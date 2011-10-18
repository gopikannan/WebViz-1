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

ActiveRecord::Schema.define(:version => 20111017180514) do

  create_table "clicks", :force => true do |t|
    t.integer  "poll_id"
    t.integer  "user_id"
    t.integer  "option"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_sets", :force => true do |t|
    t.integer  "poll_id"
    t.integer  "date"
    t.text     "poll_data",  :limit => 102400
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polls", :force => true do |t|
    t.integer  "user_id"
    t.string   "question"
    t.string   "option1"
    t.string   "option2"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "fb_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
