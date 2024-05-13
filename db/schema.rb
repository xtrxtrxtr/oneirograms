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

ActiveRecord::Schema[7.1].define(version: 2024_05_11_223009) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dream_interpretations", comment: "Dream interpretations", force: :cascade do |t|
    t.uuid "uuid", null: false
    t.bigint "dream_id", null: false
    t.uuid "user_uuid"
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dream_id"], name: "index_dream_interpretations_on_dream_id"
    t.index ["user_uuid"], name: "index_dream_interpretations_on_user_uuid"
    t.index ["uuid"], name: "index_dream_interpretations_on_uuid", unique: true
  end

  create_table "dream_personal_patterns", comment: "Links between dreams and personal patterns", force: :cascade do |t|
    t.bigint "dream_id", null: false
    t.bigint "personal_pattern_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dream_id"], name: "index_dream_personal_patterns_on_dream_id"
    t.index ["personal_pattern_id"], name: "index_dream_personal_patterns_on_personal_pattern_id"
  end

  create_table "dreams", comment: "Dreams", force: :cascade do |t|
    t.uuid "uuid", null: false
    t.uuid "user_uuid", comment: "Owner"
    t.bigint "sleep_place_id"
    t.integer "lucidity", limit: 2, default: 0, null: false
    t.integer "privacy", limit: 2, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.inet "ip"
    t.string "title"
    t.text "body", null: false
    t.index "date_trunc('month'::text, created_at)", name: "dreams_created_month_idx"
    t.index ["sleep_place_id"], name: "index_dreams_on_sleep_place_id"
    t.index ["user_uuid"], name: "index_dreams_on_user_uuid"
    t.index ["uuid"], name: "index_dreams_on_uuid", unique: true
  end

  create_table "personal_patterns", comment: "Personal dream patterns", force: :cascade do |t|
    t.uuid "uuid", null: false
    t.uuid "user_uuid", null: false, comment: "Owner (UUID)"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_uuid", "name"], name: "index_personal_patterns_on_user_uuid_and_name", unique: true
    t.index ["uuid"], name: "index_personal_patterns_on_uuid", unique: true
  end

  create_table "sleep_places", comment: "Places where dreams are seen", force: :cascade do |t|
    t.uuid "uuid", null: false
    t.uuid "user_uuid", null: false, comment: "Owner (UUID)"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_uuid", "name"], name: "index_sleep_places_on_user_uuid_and_name", unique: true
    t.index ["uuid"], name: "index_sleep_places_on_uuid", unique: true
  end

  add_foreign_key "dream_interpretations", "dreams", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dream_personal_patterns", "dreams", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dream_personal_patterns", "personal_patterns", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dreams", "sleep_places", on_update: :cascade, on_delete: :nullify
end
