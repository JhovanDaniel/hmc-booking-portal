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

ActiveRecord::Schema[7.0].define(version: 2023_02_14_233102) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string "first_nme"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "gender"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.time "time"
    t.string "appointment_number"
    t.integer "procedure_id"
    t.integer "user_id"
    t.integer "status", default: 1
  end

  create_table "payments", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "card_number"
    t.date "card_expiry"
    t.integer "cvv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount"
    t.integer "appointment_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "name"
    t.float "cost"
    t.integer "procedure_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "booking_limit"
    t.date "start_date"
    t.date "end_date"
    t.integer "is_available"
    t.text "description"
    t.text "details"
  end

  create_table "results", force: :cascade do |t|
    t.date "result_date"
    t.string "result_outcome"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "appointment_id"
    t.boolean "approval_status"
    t.integer "approved_by"
  end

  create_table "timeslots", force: :cascade do |t|
    t.integer "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "procedure_id"
    t.string "time", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
