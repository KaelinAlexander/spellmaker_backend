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

ActiveRecord::Schema.define(version: 2020_09_15_162840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.string "latin"
    t.string "planet"
    t.string "element"
    t.text "description"
    t.boolean "toxic"
  end

  create_table "components_deities", force: :cascade do |t|
    t.bigint "component_id", null: false
    t.bigint "deity_id", null: false
    t.index ["component_id"], name: "index_components_deities_on_component_id"
    t.index ["deity_id"], name: "index_components_deities_on_deity_id"
  end

  create_table "components_uses", force: :cascade do |t|
    t.bigint "component_id", null: false
    t.bigint "use_id", null: false
    t.index ["component_id"], name: "index_components_uses_on_component_id"
    t.index ["use_id"], name: "index_components_uses_on_use_id"
  end

  create_table "deities", force: :cascade do |t|
    t.string "name"
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.string "process"
    t.string "intention"
    t.text "description"
  end

  create_table "spells_components", force: :cascade do |t|
    t.integer "parts"
    t.bigint "spell_id", null: false
    t.bigint "component_id", null: false
    t.index ["component_id"], name: "index_spells_components_on_component_id"
    t.index ["spell_id"], name: "index_spells_components_on_spell_id"
  end

  create_table "synonyms", force: :cascade do |t|
    t.string "name"
    t.bigint "component_id", null: false
    t.index ["component_id"], name: "index_synonyms_on_component_id"
  end

  create_table "uses", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "components_deities", "components"
  add_foreign_key "components_deities", "deities"
  add_foreign_key "components_uses", "components"
  add_foreign_key "components_uses", "uses"
  add_foreign_key "spells_components", "components"
  add_foreign_key "spells_components", "spells"
  add_foreign_key "synonyms", "components"
end
