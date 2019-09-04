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

ActiveRecord::Schema.define(version: 2019_09_02_172656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "team_id"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "points", default: 0, null: false
    t.bigint "binary_points", default: 0, null: false
    t.index ["binary_points"], name: "index_players_on_binary_points"
    t.index ["points"], name: "index_players_on_points"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "shields", force: :cascade do |t|
    t.bigint "player_id"
    t.integer "p1", default: 0, null: false
    t.integer "p2", default: 0, null: false
    t.integer "p3", default: 0, null: false
    t.integer "p4", default: 0, null: false
    t.integer "p5", default: 0, null: false
    t.integer "p6", default: 0, null: false
    t.integer "p7", default: 0, null: false
    t.integer "p8", default: 0, null: false
    t.integer "p9", default: 0, null: false
    t.integer "p10", default: 0, null: false
    t.integer "points", default: 0, null: false
    t.bigint "binary_points", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["binary_points"], name: "index_shields_on_binary_points"
    t.index ["player_id"], name: "index_shields_on_player_id"
    t.index ["points"], name: "index_shields_on_points"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "tournament_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "points", default: 0, null: false
    t.bigint "binary_points", default: 0, null: false
    t.index ["binary_points"], name: "index_teams_on_binary_points"
    t.index ["points"], name: "index_teams_on_points"
    t.index ["tournament_id"], name: "index_teams_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "start_date", null: false
    t.string "tournament_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
