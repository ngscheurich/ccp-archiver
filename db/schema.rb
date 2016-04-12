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

ActiveRecord::Schema.define(version: 20160412145212) do

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

  create_table "stories", force: :cascade do |t|
    t.integer  "cms_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "headline"
    t.string   "byline"
    t.text     "body"
    t.string   "subhead"
    t.string   "pull_quote"
    t.text     "html_content"
    t.string   "video_id"
    t.string   "redirect_url"
    t.text     "digest"
    t.text     "infobox"
    t.string   "time_updated"
    t.string   "location"
    t.string   "video_provider"
    t.string   "promo_text"
    t.datetime "publish_date"
    t.boolean  "suppress_comments"
    t.boolean  "suppress_ads"
    t.string   "keywords"
    t.text     "html_content_two"
    t.string   "url"
    t.integer  "state"
  end

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
