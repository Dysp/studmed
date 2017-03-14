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

ActiveRecord::Schema.define(version: 20170313165907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bloodsamples", force: :cascade do |t|
    t.integer  "paraclinical_id"
    t.boolean  "creatinine"
    t.string   "creatinine_value"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "clinicals", force: :cascade do |t|
    t.text     "inspection"
    t.text     "palpation"
    t.text     "percussion"
    t.text     "auscultation"
    t.integer  "illness_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "illnesses", force: :cascade do |t|
    t.text     "etiology"
    t.text     "patogenesis"
    t.integer  "incidence"
    t.integer  "prevalence"
    t.string   "category"
    t.text     "anamnesis"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "description"
  end

  create_table "paraclinicals", force: :cascade do |t|
    t.string   "biopsy"
    t.boolean  "lfu"
    t.boolean  "ekg"
    t.integer  "illness_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "paraclinical_id"
    t.boolean  "xray"
    t.text     "xray_finding"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.text     "medical"
    t.text     "surgical"
    t.integer  "illness_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
