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

ActiveRecord::Schema[7.1].define(version: 2025_12_12_152944) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "title"
    t.date "occurs_at"
    t.string "specialty"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "caregivers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_caregivers_on_user_id"
  end

  create_table "cares", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "caregiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["caregiver_id"], name: "index_cares_on_caregiver_id"
    t.index ["patient_id"], name: "index_cares_on_patient_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "title"
    t.bigint "patient_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_chats_on_patient_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.bigint "patient_id", null: false
    t.string "dosage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_medications_on_patient_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "role"
    t.text "content"
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.date "birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "address"
    t.string "insurance"
    t.string "insurance_number"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "patients"
  add_foreign_key "caregivers", "users"
  add_foreign_key "cares", "caregivers"
  add_foreign_key "cares", "patients"
  add_foreign_key "chats", "patients"
  add_foreign_key "chats", "users"
  add_foreign_key "medications", "patients"
  add_foreign_key "messages", "chats"
  add_foreign_key "patients", "users"
end
