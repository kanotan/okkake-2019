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

ActiveRecord::Schema.define(version: 2020_05_17_013342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

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

  add_foreign_key "tag_works", "tags"
end
