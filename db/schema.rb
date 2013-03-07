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

ActiveRecord::Schema.define(:version => 20130307160750) do

  create_table "categories", :force => true do |t|
    t.string   "category_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "rank"
  end

  create_table "flags", :force => true do |t|
    t.integer  "user_id"
    t.integer  "video_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "flags", ["user_id", "video_id"], :name => "index_flags_on_user_id_and_video_id"

  create_table "leaderboards", :force => true do |t|
    t.string   "leaderboard_name"
    t.string   "leaderboard_rules"
    t.string   "leaderboard_type"
    t.text     "leaderboard_description"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "category_name"
    t.integer  "category_id"
  end

  create_table "pg_search_documents", :force => true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "activated",              :default => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "points",                 :default => 0,     :null => false
    t.string   "major"
    t.string   "year"
    t.string   "skill"
    t.text     "about"
    t.boolean  "hasVideo",               :default => false
    t.integer  "category_id"
    t.integer  "leaderboard_id"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "yt_video_id"
    t.boolean  "is_complete",    :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "points",         :default => 0,     :null => false
    t.integer  "user_id"
    t.boolean  "is_private",     :default => false
    t.integer  "category_id"
    t.integer  "leaderboard_id"
    t.integer  "flag_count",     :default => 0,     :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer "user_id"
    t.integer "video_id"
    t.boolean "voted_up",   :default => false
    t.boolean "voted_down", :default => false
  end

  add_index "votes", ["user_id", "video_id"], :name => "index_votes_on_user_id_and_video_id"

end
