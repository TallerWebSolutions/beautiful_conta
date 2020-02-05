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

ActiveRecord::Schema.define(version: 2019_09_04_123828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "calendar_events", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "contact_id"
    t.date "date"
    t.string "start_time"
    t.string "end_time"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.bigint "service_id"
    t.decimal "value"
    t.string "payment_method"
    t.string "note"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_calendar_events_on_service_id"
    t.index ["user_id"], name: "index_calendar_events_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "action"
    t.string "arguments"
    t.string "video_uri"
    t.string "status"
    t.date "publish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "message_type"
    t.string "text"
    t.string "reply_type"
    t.string "status"
    t.string "reply_from"
    t.integer "reply_id"
    t.text "original_json"
    t.string "action"
    t.string "arguments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "robots", force: :cascade do |t|
    t.string "robot_type"
    t.string "apikey"
    t.string "service_url"
    t.string "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "skill_id"
    t.string "skill_name"
    t.string "assistant_id"
    t.string "assistant_name"
    t.string "assistant_url"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.string "name"
    t.decimal "value"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_services_on_category_id"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "small_companies", force: :cascade do |t|
    t.bigint "user_id"
    t.string "cnpj"
    t.string "social_name"
    t.string "fantasy_name"
    t.string "zipcode"
    t.string "address"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "type"
    t.string "status"
    t.boolean "featured"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_small_companies_on_user_id"
  end

  create_table "user_devices", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "device_id"
    t.string "device_hash"
    t.string "arn"
    t.string "arn_subscription"
    t.text "original_json"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_devices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type"
    t.string "name"
    t.string "last_name"
    t.string "phone"
    t.string "city"
    t.string "state"
    t.string "address"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "zipcode"
    t.string "session_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "calendar_events", "services"
  add_foreign_key "calendar_events", "users"
  add_foreign_key "contacts", "users"
  add_foreign_key "documents", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "services", "categories"
  add_foreign_key "services", "users"
  add_foreign_key "small_companies", "users"
  add_foreign_key "user_devices", "users"
end
