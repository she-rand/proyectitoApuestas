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

ActiveRecord::Schema[7.0].define(version: 2022_02_22_172948) do
  create_table "bets", force: :cascade do |t|
    t.integer "bet_amount"
    t.string "bet_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id", null: false
    t.integer "raffle_id", null: false
    t.index ["player_id"], name: "index_bets_on_player_id"
    t.index ["raffle_id"], name: "index_bets_on_raffle_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "rut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players_raffles", id: false, force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "raffle_id", null: false
  end

  create_table "raffles", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weather_id", null: false
    t.index ["weather_id"], name: "index_raffles_on_weather_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id", null: false
    t.index ["player_id"], name: "index_transfers_on_player_id"
  end

  create_table "weathers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "forecast_date", precision: nil
    t.float "forecast_temp"
  end

  add_foreign_key "bets", "players"
  add_foreign_key "bets", "raffles"
  add_foreign_key "raffles", "weathers"
  add_foreign_key "transfers", "players"
end
