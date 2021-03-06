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

ActiveRecord::Schema.define(version: 20140227193314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_change_requests", force: true do |t|
    t.integer  "user_id"
    t.text     "reason_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "account_type"
  end

  add_index "account_change_requests", ["user_id"], name: "index_account_change_requests_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "point_of_interest_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["point_of_interest_id"], name: "index_comments_on_point_of_interest_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "pending_picture_uploads", force: true do |t|
    t.integer  "user_id"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pending_picture_uploads", ["picture_id"], name: "index_pending_picture_uploads_on_picture_id", using: :btree
  add_index "pending_picture_uploads", ["user_id"], name: "index_pending_picture_uploads_on_user_id", using: :btree

  create_table "pictures", id: false, force: true do |t|
    t.integer  "user_id"
    t.integer  "point_of_interest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "main_image"
  end

  create_table "point_of_interests", force: true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.text     "summary"
    t.text     "sponsor_info"
    t.text     "artist_info"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
  end

  add_index "point_of_interests", ["user_id"], name: "index_point_of_interests_on_user_id", using: :btree

  create_table "ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "point_of_interest_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["point_of_interest_id"], name: "index_ratings_on_point_of_interest_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "account_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "email"
  end

end
