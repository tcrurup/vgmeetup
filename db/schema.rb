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

ActiveRecord::Schema.define(version: 2019_07_10_233730) do

  create_table "community_boards", force: :cascade do |t|
    t.integer "game_id"
  end

  create_table "friends", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "game_genres", force: :cascade do |t|
    t.integer "game_id"
    t.integer "genre_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.integer "release_year"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "personal_boards", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.integer "board_id"
    t.string "board_type"
    t.integer "user_id"
  end

  create_table "user_friends", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "user_games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password_digest"
  end

end
