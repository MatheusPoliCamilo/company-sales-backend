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

ActiveRecord::Schema.define(version: 2021_08_11_031531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "company_sales", id: :serial, force: :cascade do |t|
    t.date "imported_at"
    t.float "total_gross_income"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "merchants", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "sale_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sale_id"], name: "index_merchants_on_sale_id"
  end

  create_table "sales", id: :serial, force: :cascade do |t|
    t.string "purchaser_name"
    t.string "item_description"
    t.float "item_price"
    t.integer "purchase_count"
    t.bigint "company_sale_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_sale_id"], name: "index_sales_on_company_sale_id"
  end

end
