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

ActiveRecord::Schema.define(version: 2019_07_22_111256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_notification_conditions", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "gender"
    t.integer "age_min"
    t.integer "age_max"
    t.integer "prefecture_ids", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_article_notification_conditions_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "body"
    t.integer "prefecture_ids", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "improvement_requests", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "request_type"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_improvement_requests_on_user_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.bigint "user_id"
    t.string "reply_email"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_inquiries_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notification_settings", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "receive_article_arrival_notifications", default: true
    t.boolean "receive_message_notifications", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_notification_settings_on_user_id"
  end

  create_table "privacy_settings", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "show_activity_prefecture", default: true, comment: "活動都道府県の公開設定"
    t.boolean "show_gender", default: true, comment: "性別の公開設定"
    t.boolean "show_age", default: true, comment: "年齢の公開設定"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_privacy_settings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "activity_prefecture_ids", default: [], array: true
    t.string "avatar"
    t.date "birthday"
    t.integer "gender"
    t.string "name"
    t.string "introduction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "article_notification_conditions", "users"
  add_foreign_key "articles", "users"
  add_foreign_key "improvement_requests", "users"
  add_foreign_key "inquiries", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "notification_settings", "users"
  add_foreign_key "privacy_settings", "users"
end
