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

ActiveRecord::Schema.define(version: 20150322200523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "categories_photos", id: false, force: :cascade do |t|
    t.integer "photo_id"
    t.integer "category_id"
  end

  add_index "categories_photos", ["photo_id", "category_id"], name: "index_categories_photos_on_photo_id_and_category_id", using: :btree

  create_table "collections", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name"
    t.text    "description"
  end

  create_table "monuments", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image_uid"
    t.string   "title"
    t.integer  "user_id"
    t.integer  "monument_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "collection_id"
  end

  create_table "photos_categories", id: false, force: :cascade do |t|
    t.integer "photo_id"
    t.integer "category_id"
  end

  add_index "photos_categories", ["photo_id", "category_id"], name: "index_photos_categories_on_photo_id_and_category_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
