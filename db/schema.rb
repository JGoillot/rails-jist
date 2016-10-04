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

ActiveRecord::Schema.define(version: 20161004164829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.date     "writed_at"
    t.integer  "journalist_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["journalist_id"], name: "index_articles_on_journalist_id", using: :btree
  end

  create_table "journalist_keywords", force: :cascade do |t|
    t.integer  "journalist_id"
    t.integer  "keyword_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["journalist_id"], name: "index_journalist_keywords_on_journalist_id", using: :btree
    t.index ["keyword_id"], name: "index_journalist_keywords_on_keyword_id", using: :btree
  end

  create_table "journalists", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "twitter_user_name"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_lists", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "journalist_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["journalist_id"], name: "index_personal_lists_on_journalist_id", using: :btree
    t.index ["user_id"], name: "index_personal_lists_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "title"
    t.string   "startup_name"
    t.boolean  "prenium"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "articles", "journalists"
  add_foreign_key "journalist_keywords", "journalists"
  add_foreign_key "journalist_keywords", "keywords"
  add_foreign_key "personal_lists", "journalists"
  add_foreign_key "personal_lists", "users"
end
