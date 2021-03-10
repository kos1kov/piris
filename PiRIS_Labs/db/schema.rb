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

ActiveRecord::Schema.define(version: 2021_03_09_175812) do

  create_table "comments", force: :cascade do |t|
    t.string "username"
    t.text "body"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "credit_plan", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.decimal "percent", precision: 6, scale: 2
    t.integer "credit_id"
    t.index ["credit_id"], name: "index_credit_plan_on_credit_id"
  end

  create_table "credit_plans", force: :cascade do |t|
    t.string "name"
    t.decimal "percent", precision: 6, scale: 2
    t.string "credit_id"
  end

  create_table "credits", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.float "percent_sum"
    t.integer "percent"
    t.integer "sum"
    t.integer "user_id"
    t.integer "credit_plan_id"
    t.string "credit_type"
    t.string "typeOfCurrency"
    t.string "credit_plan"
    t.string "user"
    t.boolean "active"
    t.index ["credit_plan_id"], name: "index_credits_on_credit_plan_id"
    t.index ["user_id"], name: "index_credits_on_user_id"
  end

  create_table "deposits", force: :cascade do |t|
    t.string "typeOfDeposit"
    t.string "typeOfCurrency"
    t.float "sumOfDeposit"
    t.integer "percent"
    t.float "percentSum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "depositUser"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "surname"
    t.string "name"
    t.string "secondname"
    t.date "borndate"
    t.boolean "sex"
    t.string "passportserial"
    t.string "passportnum"
    t.string "issuebody"
    t.date "dateissue"
    t.string "identnum"
    t.string "bornissue"
    t.string "factcity"
    t.string "factadress"
    t.string "homephone"
    t.string "phone"
    t.string "email"
    t.string "regaddress"
    t.string "materialstatus"
    t.string "citizenship"
    t.string "disability"
    t.boolean "pensioner"
    t.integer "monthincome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
