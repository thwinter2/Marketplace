# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_16_032605) do

  create_table "items", force: :cascade do |t|
    t.integer "unique_id"
    t.string "name"
    t.string "brand"
    t.string "category"
    t.text "description"
    t.string "image"
    t.boolean "special_item"
    t.boolean "age_restricted"
    t.integer "quantity"
    t.decimal "cost"
    t.string "tax_slab"
    t.integer "views_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "phone"
    t.date "dob"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "card_name"
    t.integer "card_num"
    t.date "card_expiration"
    t.integer "card_cvv"
    t.string "cart"
    t.string "wishlist"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
