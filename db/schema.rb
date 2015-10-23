# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151023115900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.json     "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "name"
    t.decimal  "lat"
    t.decimal  "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainings", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainings_regions", id: false, force: true do |t|
    t.integer "training_id"
    t.integer "region_id"
  end

  add_index "trainings_regions", ["region_id"], name: "index_trainings_regions_on_region_id", using: :btree
  add_index "trainings_regions", ["training_id"], name: "index_trainings_regions_on_training_id", using: :btree

  create_table "trainings_subjects", id: false, force: true do |t|
    t.integer "training_id"
    t.integer "subject_id"
  end

  add_index "trainings_subjects", ["subject_id"], name: "index_trainings_subjects_on_subject_id", using: :btree
  add_index "trainings_subjects", ["training_id"], name: "index_trainings_subjects_on_training_id", using: :btree

end
