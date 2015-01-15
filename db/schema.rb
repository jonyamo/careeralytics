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

ActiveRecord::Schema.define(version: 20150115030741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_jobs", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "job_id"
  end

  add_index "categories_jobs", ["category_id"], name: "index_categories_jobs_on_category_id", using: :btree
  add_index "categories_jobs", ["job_id"], name: "index_categories_jobs_on_job_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree

  create_table "jobs", force: true do |t|
    t.string   "guid",          limit: 1024
    t.string   "url",           limit: 1024
    t.string   "title",         limit: 1024
    t.text     "summary"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.boolean  "allows_remote"
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree
  add_index "jobs", ["guid"], name: "index_jobs_on_guid", unique: true, using: :btree

  create_table "jobs_locations", id: false, force: true do |t|
    t.integer "job_id"
    t.integer "location_id"
  end

  add_index "jobs_locations", ["job_id"], name: "index_jobs_locations_on_job_id", using: :btree
  add_index "jobs_locations", ["location_id"], name: "index_jobs_locations_on_location_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
