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

ActiveRecord::Schema.define(version: 2018_09_30_193605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "logo_url"
    t.datetime "created_at", default: -> { "now()" }
    t.datetime "updated_at", default: -> { "now()" }
  end

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.string "iata"
    t.string "icao"
    t.float "latitude"
    t.float "longitude"
    t.integer "elevation_in_feet"
    t.float "gmt"
    t.string "timezone"
    t.datetime "created_at", default: -> { "now()" }
    t.datetime "updated_at", default: -> { "now()" }
    t.index ["iata"], name: "index_airports_on_iata"
    t.index ["icao"], name: "index_airports_on_icao"
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_num"
    t.string "origin"
    t.string "destination"
    t.datetime "departure_datetime"
    t.datetime "arrival_datetime"
    t.string "origin_tz"
    t.string "destination_tz"
    t.integer "distance"
    t.string "unique_carrier"
    t.integer "price"
    t.datetime "created_at", default: -> { "now()" }
    t.datetime "updated_at", default: -> { "now()" }
    t.index ["arrival_datetime"], name: "index_flights_on_arrival_datetime"
    t.index ["departure_datetime"], name: "index_flights_on_departure_datetime"
    t.index ["destination"], name: "index_flights_on_destination"
    t.index ["origin"], name: "index_flights_on_origin"
  end

end
