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

ActiveRecord::Schema.define(:version => 20121206012710) do

  create_table "contests", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "ending"
    t.integer  "user_id"
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contests", ["user_id"], :name => "index_contests_on_user_id"

  create_table "participations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "contest_id"
    t.boolean  "donor"
    t.boolean  "winner"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "participations", ["contest_id"], :name => "index_participations_on_contest_id"
  add_index "participations", ["user_id"], :name => "index_participations_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "pwh"
    t.string   "pws"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
