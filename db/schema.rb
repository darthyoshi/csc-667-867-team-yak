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

ActiveRecord::Schema.define(version: 20131103003826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_pieces", force: true do |t|
    t.string   "category"
    t.string   "title"
    t.float    "price"
    t.integer  "quantity"
    t.string   "image_path"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "arttags", force: true do |t|
    t.string   "tagname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "arttags_artworks", id: false, force: true do |t|
    t.integer "artwork_id"
    t.integer "arttag_id"
  end

  create_table "artworks", force: true do |t|
    t.string   "category"
    t.string   "title"
    t.decimal  "price",       precision: 7, scale: 2
    t.integer  "quantity"
    t.string   "imagepath"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seller_id"
  end

  add_index "artworks", ["seller_id"], name: "index_artworks_on_seller_id", using: :btree

  create_table "ordereditems", force: true do |t|
    t.integer  "order_id"
    t.integer  "sold_artwork_id"
    t.integer  "quantity"
    t.decimal  "price"
    t.string   "category"
    t.string   "title"
    t.string   "imagepath"
    t.text     "description"
    t.string   "seller_name"
    t.string   "seller_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.datetime "order_date"
    t.text     "shipping_address"
    t.decimal  "shipping_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "stars"
    t.integer  "user_id"
    t.integer  "seller_id"
    t.text     "review_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "review_date"
  end

  create_table "sellers", force: true do |t|
    t.string   "displayed_name"
    t.text     "seller_description"
    t.string   "seller_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "seller_date"
  end

  create_table "shoppingcartitems", force: true do |t|
    t.integer  "quantity"
    t.integer  "user_id"
    t.integer  "artwork_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "shipping_address"
    t.datetime "date_joined"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
