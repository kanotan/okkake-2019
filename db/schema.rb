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

ActiveRecord::Schema.define(version: 2020_08_10_194044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "tag_anime_seasons", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.text "abstract"
    t.integer "reviews_count", default: 0, null: false
    t.float "aggregate_rating_count"
    t.float "review_score"
    t.string "content_rating"
    t.string "copyright_holder"
    t.integer "copyright_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_anime_series_id"
    t.index ["old_slug"], name: "index_tag_anime_seasons_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_anime_seasons_on_slug", unique: true
    t.index ["tag_anime_series_id"], name: "index_tag_anime_seasons_on_tag_anime_series_id"
  end

  create_table "tag_anime_series", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.bigint "tag_work_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["old_slug"], name: "index_tag_anime_series_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_anime_series_on_slug", unique: true
    t.index ["tag_work_id"], name: "index_tag_anime_series_on_tag_work_id"
  end

  create_table "tag_book_series", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.text "abstract"
    t.integer "reviews_count", default: 0, null: false
    t.float "aggregate_rating_count"
    t.float "review_score"
    t.string "content_rating"
    t.string "copyright_holder"
    t.integer "copyright_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_work_id"
    t.index ["old_slug"], name: "index_tag_book_series_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_book_series_on_slug", unique: true
    t.index ["tag_work_id"], name: "index_tag_book_series_on_tag_work_id"
  end

  create_table "tag_comic_stories", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.text "abstract"
    t.integer "reviews_count", default: 0, null: false
    t.float "aggregate_rating_count"
    t.float "review_score"
    t.string "content_rating"
    t.string "copyright_holder"
    t.integer "copyright_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_work_id"
    t.index ["old_slug"], name: "index_tag_comic_stories_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_comic_stories_on_slug", unique: true
    t.index ["tag_work_id"], name: "index_tag_comic_stories_on_tag_work_id"
  end

  create_table "tag_movie_series", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.bigint "tag_work_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["old_slug"], name: "index_tag_movie_series_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_movie_series_on_slug", unique: true
    t.index ["tag_work_id"], name: "index_tag_movie_series_on_tag_work_id"
  end

  create_table "tag_movies", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.text "abstract"
    t.integer "reviews_count", default: 0, null: false
    t.float "aggregate_rating_count"
    t.float "review_score"
    t.string "content_rating"
    t.string "copyright_holder"
    t.integer "copyright_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_movie_series_id"
    t.index ["old_slug"], name: "index_tag_movies_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_movies_on_slug", unique: true
    t.index ["tag_movie_series_id"], name: "index_tag_movies_on_tag_movie_series_id"
  end

  create_table "tag_music_playlists", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.text "abstract"
    t.integer "reviews_count", default: 0, null: false
    t.float "aggregate_rating_count"
    t.float "review_score"
    t.string "content_rating"
    t.string "copyright_holder"
    t.integer "copyright_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_work_id"
    t.index ["old_slug"], name: "index_tag_music_playlists_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_music_playlists_on_slug", unique: true
    t.index ["tag_work_id"], name: "index_tag_music_playlists_on_tag_work_id"
  end

  create_table "tag_music_recordings", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.text "abstract"
    t.integer "reviews_count", default: 0, null: false
    t.float "aggregate_rating_count"
    t.float "review_score"
    t.string "content_rating"
    t.string "copyright_holder"
    t.integer "copyright_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_work_id"
    t.index ["old_slug"], name: "index_tag_music_recordings_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_music_recordings_on_slug", unique: true
    t.index ["tag_work_id"], name: "index_tag_music_recordings_on_tag_work_id"
  end

  create_table "tag_people", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.string "in_language"
    t.string "family_name"
    t.string "given_name"
    t.string "additional_name"
    t.string "gender"
    t.string "blood_type"
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_date"
    t.integer "death_year"
    t.integer "death_month"
    t.integer "death_date"
    t.string "birth_place"
    t.string "death_place"
    t.float "height"
    t.float "weight"
    t.float "bust"
    t.float "waist"
    t.float "hip"
    t.float "shoe_size"
    t.integer "follows_count", default: 0, null: false
    t.integer "comments_count", default: 0, null: false
    t.integer "trivias_count", default: 0, null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["old_slug"], name: "index_tag_people_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_people_on_slug", unique: true
    t.index ["tag_id"], name: "index_tag_people_on_tag_id"
  end

  create_table "tag_radio_drama_seasons", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.text "abstract"
    t.integer "reviews_count", default: 0, null: false
    t.float "aggregate_rating_count"
    t.float "review_score"
    t.string "content_rating"
    t.string "copyright_holder"
    t.integer "copyright_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_radio_drama_series_id"
    t.index ["old_slug"], name: "index_tag_radio_drama_seasons_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_radio_drama_seasons_on_slug", unique: true
    t.index ["tag_radio_drama_series_id"], name: "index_tag_radio_drama_seasons_on_tag_radio_drama_series_id"
  end

  create_table "tag_radio_drama_series", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.bigint "tag_work_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["old_slug"], name: "index_tag_radio_drama_series_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_radio_drama_series_on_slug", unique: true
    t.index ["tag_work_id"], name: "index_tag_radio_drama_series_on_tag_work_id"
  end

  create_table "tag_radio_seasons", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.text "abstract"
    t.integer "reviews_count", default: 0, null: false
    t.float "aggregate_rating_count"
    t.float "review_score"
    t.string "content_rating"
    t.string "copyright_holder"
    t.integer "copyright_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_radio_series_id"
    t.index ["old_slug"], name: "index_tag_radio_seasons_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_radio_seasons_on_slug", unique: true
    t.index ["tag_radio_series_id"], name: "index_tag_radio_seasons_on_tag_radio_series_id"
  end

  create_table "tag_radio_series", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.bigint "tag_work_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["old_slug"], name: "index_tag_radio_series_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_radio_series_on_slug", unique: true
    t.index ["tag_work_id"], name: "index_tag_radio_series_on_tag_work_id"
  end

  create_table "tag_streaming_seasons", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.text "abstract"
    t.integer "reviews_count", default: 0, null: false
    t.float "aggregate_rating_count"
    t.float "review_score"
    t.string "content_rating"
    t.string "copyright_holder"
    t.integer "copyright_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_streaming_series_id"
    t.index ["old_slug"], name: "index_tag_streaming_seasons_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_streaming_seasons_on_slug", unique: true
    t.index ["tag_streaming_series_id"], name: "index_tag_streaming_seasons_on_tag_streaming_series_id"
  end

  create_table "tag_streaming_series", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.bigint "tag_work_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["old_slug"], name: "index_tag_streaming_series_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_streaming_series_on_slug", unique: true
    t.index ["tag_work_id"], name: "index_tag_streaming_series_on_tag_work_id"
  end

  create_table "tag_tv_drama_seasons", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.text "abstract"
    t.integer "reviews_count", default: 0, null: false
    t.float "aggregate_rating_count"
    t.float "review_score"
    t.string "content_rating"
    t.string "copyright_holder"
    t.integer "copyright_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_tv_drama_series_id"
    t.index ["old_slug"], name: "index_tag_tv_drama_seasons_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_tv_drama_seasons_on_slug", unique: true
    t.index ["tag_tv_drama_series_id"], name: "index_tag_tv_drama_seasons_on_tag_tv_drama_series_id"
  end

  create_table "tag_tv_drama_series", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.bigint "tag_work_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["old_slug"], name: "index_tag_tv_drama_series_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_tv_drama_series_on_slug", unique: true
    t.index ["tag_work_id"], name: "index_tag_tv_drama_series_on_tag_work_id"
  end

  create_table "tag_tv_seasons", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.text "abstract"
    t.integer "reviews_count", default: 0, null: false
    t.float "aggregate_rating_count"
    t.float "review_score"
    t.string "content_rating"
    t.string "copyright_holder"
    t.integer "copyright_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_tv_series_id"
    t.index ["old_slug"], name: "index_tag_tv_seasons_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_tv_seasons_on_slug", unique: true
    t.index ["tag_tv_series_id"], name: "index_tag_tv_seasons_on_tag_tv_series_id"
  end

  create_table "tag_tv_series", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.bigint "tag_work_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["old_slug"], name: "index_tag_tv_series_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_tv_series_on_slug", unique: true
    t.index ["tag_work_id"], name: "index_tag_tv_series_on_tag_work_id"
  end

  create_table "tag_video_game_series", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.bigint "tag_work_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["old_slug"], name: "index_tag_video_game_series_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_video_game_series_on_slug", unique: true
    t.index ["tag_work_id"], name: "index_tag_video_game_series_on_tag_work_id"
  end

  create_table "tag_video_games", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.text "abstract"
    t.integer "reviews_count", default: 0, null: false
    t.float "aggregate_rating_count"
    t.float "review_score"
    t.string "content_rating"
    t.string "copyright_holder"
    t.integer "copyright_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_video_game_series_id"
    t.index ["old_slug"], name: "index_tag_video_games_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_video_games_on_slug", unique: true
    t.index ["tag_video_game_series_id"], name: "index_tag_video_games_on_tag_video_game_series_id"
  end

  create_table "tag_works", force: :cascade do |t|
    t.string "slug", null: false
    t.string "old_slug"
    t.string "in_language"
    t.integer "follows_count", default: 0, null: false
    t.integer "comments_count", default: 0, null: false
    t.integer "trivias_count", default: 0, null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["old_slug"], name: "index_tag_works_on_old_slug", unique: true
    t.index ["slug"], name: "index_tag_works_on_slug", unique: true
    t.index ["tag_id"], name: "index_tag_works_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana"
    t.string "name_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.datetime "remember_created_at"
    t.string "remember_token"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "provider", null: false
    t.string "uid", default: "", null: false
    t.string "screen_name"
    t.string "twitter_access_token"
    t.string "twitter_access_secret"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
    t.index ["screen_name"], name: "index_users_on_screen_name", unique: true
  end

  add_foreign_key "tag_anime_seasons", "tag_anime_series"
  add_foreign_key "tag_anime_series", "tag_works"
  add_foreign_key "tag_book_series", "tag_works"
  add_foreign_key "tag_comic_stories", "tag_works"
  add_foreign_key "tag_movie_series", "tag_works"
  add_foreign_key "tag_movies", "tag_movie_series"
  add_foreign_key "tag_music_playlists", "tag_works"
  add_foreign_key "tag_music_recordings", "tag_works"
  add_foreign_key "tag_people", "tags"
  add_foreign_key "tag_radio_drama_seasons", "tag_radio_drama_series"
  add_foreign_key "tag_radio_drama_series", "tag_works"
  add_foreign_key "tag_radio_seasons", "tag_radio_series"
  add_foreign_key "tag_radio_series", "tag_works"
  add_foreign_key "tag_streaming_seasons", "tag_streaming_series"
  add_foreign_key "tag_streaming_series", "tag_works"
  add_foreign_key "tag_tv_drama_seasons", "tag_tv_drama_series"
  add_foreign_key "tag_tv_drama_series", "tag_works"
  add_foreign_key "tag_tv_seasons", "tag_tv_series"
  add_foreign_key "tag_tv_series", "tag_works"
  add_foreign_key "tag_video_game_series", "tag_works"
  add_foreign_key "tag_video_games", "tag_video_game_series"
  add_foreign_key "tag_works", "tags"
end
