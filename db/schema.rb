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

ActiveRecord::Schema.define(version: 20160425192150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_responses", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "elapsed_time"
    t.text     "body"
    t.datetime "initiated_at"
    t.text     "headers"
    t.integer  "code"
    t.string   "message"
  end

  create_table "archives", force: :cascade do |t|
    t.binary   "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_section_mappings", force: :cascade do |t|
    t.string   "category"
    t.string   "subcategory"
    t.string   "section"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_section_mappings", ["category", "subcategory"], name: "index_category_section_mappings_on_category_and_subcategory", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "invites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "photo_id"
    t.string   "byline"
    t.string   "credit"
    t.text     "caption"
    t.string   "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos_stories", id: false, force: :cascade do |t|
    t.integer "photo_id"
    t.integer "story_id"
  end

  add_index "photos_stories", ["photo_id"], name: "index_photos_stories_on_photo_id", using: :btree
  add_index "photos_stories", ["story_id"], name: "index_photos_stories_on_story_id", using: :btree

  create_table "stories", force: :cascade do |t|
    t.integer  "cms_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "headline"
    t.string   "byline"
    t.text     "body"
    t.string   "subhead"
    t.text     "infobox"
    t.string   "time_updated"
    t.string   "location"
    t.datetime "publish_date"
    t.string   "keywords"
    t.string   "url"
    t.integer  "state"
    t.string   "category"
    t.string   "subcategory"
    t.integer  "api_response_id"
  end

  add_index "stories", ["api_response_id"], name: "index_stories_on_api_response_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
