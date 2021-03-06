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

ActiveRecord::Schema.define(version: 20160930004557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokedexes", force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "pokemon_id", null: false
    t.index ["pokemon_id"], name: "index_pokedexes_on_pokemon_id", using: :btree
    t.index ["user_id"], name: "index_pokedexes_on_user_id", using: :btree
  end

  create_table "pokemons", force: :cascade do |t|
    t.string  "name",   null: false
    t.string  "type_1", null: false
    t.string  "type_2"
    t.integer "cp",     null: false
    t.integer "hp",     null: false
    t.string  "move_1", null: false
    t.string  "move_2", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.string   "name",             null: false
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
