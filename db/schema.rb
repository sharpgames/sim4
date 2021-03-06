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

ActiveRecord::Schema.define(version: 20150922131728) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "clons", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "person_id"
    t.integer  "affinity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clons", ["game_id", "person_id"], name: "index_clons_on_game_id_and_person_id", unique: true
  add_index "clons", ["game_id"], name: "index_clons_on_game_id"
  add_index "clons", ["person_id"], name: "index_clons_on_person_id"

  create_table "comments", force: :cascade do |t|
    t.string   "desc"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "score"
    t.integer  "turn"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "phase"
  end

  add_index "games", ["user_id", "created_at"], name: "index_games_on_user_id_and_created_at"

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.text     "tags"
    t.integer  "affinity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fake_name"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "clon_id"
    t.integer  "work_id"
    t.integer  "favorability"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["clon_id", "work_id"], name: "index_relationships_on_clon_id_and_work_id", unique: true
  add_index "relationships", ["clon_id"], name: "index_relationships_on_clon_id"
  add_index "relationships", ["work_id"], name: "index_relationships_on_work_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.boolean  "admin",                  default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "watch_cards", force: :cascade do |t|
    t.integer "game_id"
    t.text    "work_ids"
  end

  add_index "watch_cards", ["game_id", "work_ids"], name: "index_watch_cards_on_game_id_and_work_ids", unique: true
  add_index "watch_cards", ["game_id"], name: "index_watch_cards_on_game_id"
  add_index "watch_cards", ["work_ids"], name: "index_watch_cards_on_work_ids"

  create_table "works", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "year"
    t.integer  "genre"
  end

end
