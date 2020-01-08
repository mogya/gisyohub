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

ActiveRecord::Schema.define(version: 2020_01_07_083748) do

  create_table "tweets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "user_id", null: false
    t.string "text", null: false
    t.text "row", null: false
    t.datetime "tweeted_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["text"], name: "index_tweets_on_text"
    t.index ["tweet_id"], name: "index_tweets_on_tweet_id"
    t.index ["updated_at"], name: "index_tweets_on_updated_at"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "twitter_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "twitter_user_id", null: false
    t.string "name", null: false
    t.string "screen_name", null: false
    t.string "location"
    t.text "description"
    t.string "url"
    t.text "profile_image_url"
    t.text "row", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_twitter_users_on_name"
    t.index ["screen_name"], name: "index_twitter_users_on_screen_name"
    t.index ["twitter_user_id"], name: "index_twitter_users_on_twitter_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "user_name", null: false
    t.string "image_url"
    t.string "email"
    t.string "access_token", null: false
    t.string "access_secret", null: false
    t.text "raw_auth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["uid"], name: "index_users_on_uid"
  end

end
