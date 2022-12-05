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

ActiveRecord::Schema[7.0].define(version: 2022_12_05_111650) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_chat_rooms_on_movie_id"
  end

  create_table "followed_movies", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_followed_movies_on_movie_id"
    t.index ["user_id"], name: "index_followed_movies_on_user_id"
  end

  create_table "followed_users", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "followee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followee_id"], name: "index_followed_users_on_followee_id"
    t.index ["follower_id"], name: "index_followed_users_on_follower_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "poster_url"
    t.string "trailer_url"
    t.string "imdb_id"
    t.string "plot_short"
    t.text "plot_long"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "media_type"
    t.string "year"
    t.string "genre"
    t.string "director"
    t.string "actors"
  end

  create_table "newspapers", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "post_votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_votes_on_post_id"
    t.index ["user_id"], name: "index_post_votes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "chat_room_id", null: false
    t.text "content"
    t.bigint "user_id", null: false
    t.integer "likes", default: 0
    t.integer "dislikes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_posts_on_chat_room_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.text "content"
    t.bigint "user_id", null: false
    t.integer "likes", default: 0
    t.integer "dislikes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "notification_id"
    t.boolean "read", default: false, null: false
    t.index ["notification_id"], name: "index_replies_on_notification_id"
    t.index ["post_id"], name: "index_replies_on_post_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "reply_votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "reply_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reply_id"], name: "index_reply_votes_on_reply_id"
    t.index ["user_id"], name: "index_reply_votes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chat_rooms", "movies"
  add_foreign_key "followed_movies", "movies"
  add_foreign_key "followed_movies", "users"
  add_foreign_key "followed_users", "users", column: "followee_id"
  add_foreign_key "followed_users", "users", column: "follower_id"
  add_foreign_key "notifications", "users"
  add_foreign_key "post_votes", "posts"
  add_foreign_key "post_votes", "users"
  add_foreign_key "posts", "chat_rooms"
  add_foreign_key "posts", "users"
  add_foreign_key "replies", "notifications"
  add_foreign_key "replies", "posts"
  add_foreign_key "replies", "users"
  add_foreign_key "reply_votes", "replies"
  add_foreign_key "reply_votes", "users"
end
