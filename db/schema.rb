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

ActiveRecord::Schema.define(version: 20170321030706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string   "date_start", null: false
    t.string   "date_end",   null: false
    t.integer  "user_id"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_bookings_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "listings", force: :cascade do |t|
    t.string   "name",                null: false
    t.text     "description",         null: false
    t.string   "house_rules",         null: false
    t.string   "number_of_beds",      null: false
    t.string   "number_of_guests",    null: false
    t.string   "number_of_bedrooms",  null: false
    t.string   "number_of_bathrooms", null: false
    t.string   "street_location",     null: false
    t.string   "city_location",       null: false
    t.string   "country_location",    null: false
    t.string   "price",               null: false
    t.string   "date_start",          null: false
    t.string   "date_end",            null: false
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["user_id"], name: "index_listings_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "cleanliness",   null: false
    t.string   "communication", null: false
    t.string   "location",      null: false
    t.string   "value",         null: false
    t.string   "comment",       null: false
    t.integer  "listing_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["listing_id"], name: "index_reviews_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "phone_number",                   null: false
    t.string   "email",                          null: false
    t.string   "government_id",                  null: false
    t.string   "location",                       null: false
    t.string   "gender",                         null: false
    t.string   "birthday",                       null: false
    t.text     "autobiography",                  null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "bookings", "listings"
  add_foreign_key "bookings", "users"
  add_foreign_key "listings", "users"
  add_foreign_key "reviews", "listings"
  add_foreign_key "reviews", "users"
end
