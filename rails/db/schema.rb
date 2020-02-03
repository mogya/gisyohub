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

ActiveRecord::Schema.define(version: 2020_02_03_073738) do

  create_table "administrators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_administrators_on_user_id"
  end

  create_table "assignment_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "worker_id", null: false
    t.bigint "tweet_id"
    t.bigint "book_id"
    t.bigint "event_id"
    t.integer "actionType"
    t.text "log"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_assignment_logs_on_author_id"
    t.index ["book_id"], name: "index_assignment_logs_on_book_id"
    t.index ["event_id"], name: "index_assignment_logs_on_event_id"
    t.index ["tweet_id"], name: "index_assignment_logs_on_tweet_id"
    t.index ["worker_id"], name: "index_assignment_logs_on_worker_id"
  end

  create_table "authors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "twitter_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["twitter_user_id"], name: "index_authors_on_twitter_user_id"
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "book_authors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_book_authors_on_author_id"
    t.index ["book_id"], name: "index_book_authors_on_book_id"
  end

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "title"
    t.string "keyword"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_authors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "event_id", null: false
    t.string "space_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_event_authors_on_author_id"
    t.index ["event_id"], name: "index_event_authors_on_event_id"
  end

  create_table "event_books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_event_books_on_book_id"
    t.index ["event_id"], name: "index_event_books_on_event_id"
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "title"
    t.string "keyword"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "job_type", null: false
    t.text "variable_json"
    t.datetime "started_at", null: false
    t.datetime "finished_at"
    t.text "log"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["finished_at"], name: "index_job_logs_on_finished_at"
    t.index ["job_type"], name: "index_job_logs_on_job_type"
    t.index ["started_at"], name: "index_job_logs_on_started_at"
  end

  create_table "tweets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "twitter_user_id", null: false
    t.string "text", null: false
    t.text "raw", null: false
    t.datetime "tweeted_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["text"], name: "index_tweets_on_text"
    t.index ["tweet_id"], name: "index_tweets_on_tweet_id"
    t.index ["twitter_user_id"], name: "index_tweets_on_twitter_user_id"
    t.index ["updated_at"], name: "index_tweets_on_updated_at"
  end

  create_table "twitter_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "twitter_user_id", null: false
    t.string "name", null: false
    t.string "screen_name", null: false
    t.string "location"
    t.text "description"
    t.string "url"
    t.text "profile_image_url"
    t.text "raw", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_twitter_users_on_name"
    t.index ["screen_name"], name: "index_twitter_users_on_screen_name"
    t.index ["twitter_user_id"], name: "index_twitter_users_on_twitter_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
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

  create_table "workers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "twitter_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["twitter_user_id"], name: "index_workers_on_twitter_user_id"
    t.index ["user_id"], name: "index_workers_on_user_id"
  end

  add_foreign_key "administrators", "users"
  add_foreign_key "assignment_logs", "authors"
  add_foreign_key "assignment_logs", "books"
  add_foreign_key "assignment_logs", "events"
  add_foreign_key "assignment_logs", "tweets"
  add_foreign_key "assignment_logs", "workers"
  add_foreign_key "authors", "twitter_users"
  add_foreign_key "authors", "users"
  add_foreign_key "book_authors", "authors"
  add_foreign_key "book_authors", "books"
  add_foreign_key "event_authors", "authors"
  add_foreign_key "event_authors", "events"
  add_foreign_key "event_books", "books"
  add_foreign_key "event_books", "events"
  add_foreign_key "workers", "twitter_users"
  add_foreign_key "workers", "users"
end
