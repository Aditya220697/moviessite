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

ActiveRecord::Schema[7.0].define(version: 2023_08_21_060454) do
  create_table "images", force: :cascade do |t|
    t.integer "movie_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "short_title"
    t.text "title"
    t.string "thumbnail"
    t.string "imdb_link"
    t.string "genre"
    t.string "rating"
    t.string "short_description"
    t.string "director"
    t.string "creator"
    t.string "actors"
    t.string "date"
    t.string "time"
    t.string "language"
    t.string "resolution"
    t.text "story"
    t.string "mobile_hd_download_link"
    t.string "medium_hd_download_link"
    t.string "full_hd_download_link"
    t.string "trailer_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
