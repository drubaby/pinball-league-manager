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

ActiveRecord::Schema.define(version: 2020_03_08_234753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "divisions", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_divisions_on_season_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active", "league_id"], name: "index_locations_on_active_and_league_id"
    t.index ["league_id"], name: "index_locations_on_league_id"
  end

  create_table "machine_matches", force: :cascade do |t|
    t.bigint "machine_id", null: false
    t.bigint "match_id", null: false
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_machine_matches_on_machine_id"
    t.index ["match_id"], name: "index_machine_matches_on_match_id"
  end

  create_table "machines", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.bigint "location_id", null: false
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active", "location_id"], name: "index_machines_on_active_and_location_id"
    t.index ["league_id"], name: "index_machines_on_league_id"
    t.index ["location_id"], name: "index_machines_on_location_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "meet_id", null: false
    t.bigint "location_id", null: false
    t.bigint "machine_id", null: false
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_matches_on_location_id"
    t.index ["machine_id"], name: "index_matches_on_machine_id"
    t.index ["meet_id"], name: "index_matches_on_meet_id"
  end

  create_table "meets", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_meets_on_season_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ifpa_id"
    t.index ["league_id"], name: "index_players_on_league_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "machine_id", null: false
    t.bigint "player_id", null: false
    t.bigint "season_id", null: false
    t.bigint "score", null: false
    t.boolean "disqualified", default: false, null: false
    t.integer "tie_break_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_scores_on_machine_id"
    t.index ["match_id"], name: "index_scores_on_match_id"
    t.index ["player_id"], name: "index_scores_on_player_id"
    t.index ["season_id"], name: "index_scores_on_season_id"
  end

  create_table "scoring_rules", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.integer "players", null: false
    t.integer "position", null: false
    t.integer "points", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_scoring_rules_on_season_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "league_id", null: false
    t.datetime "start_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_seasons_on_league_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "name"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
