# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2024_12_23_161547) do
  create_table "auth_tokens", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.string "token"
    t.datetime "updated_at", null: false
  end

  create_table "loans", id: :string, charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "author"
    t.string "barcode"
    t.string "call_number"
    t.datetime "checkout_date", precision: nil
    t.datetime "created_at", null: false
    t.string "description"
    t.string "mms_id"
    t.datetime "return_date", precision: nil
    t.string "title"
    t.datetime "updated_at", null: false
    t.string "user_uniqname", null: false
    t.index ["user_uniqname"], name: "index_loans_on_user_uniqname"
  end

  create_table "users", primary_key: "uniqname", id: :string, charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.boolean "retain_history", default: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "loans", "users", column: "user_uniqname", primary_key: "uniqname"
end
