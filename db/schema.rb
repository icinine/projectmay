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

ActiveRecord::Schema.define(version: 20150711103857) do

  create_table "agreement_types", force: true do |t|
    t.string "name"
  end

  create_table "contract_agreements", force: true do |t|
    t.integer "agreement_type_id"
    t.integer "contract_id"
  end

  create_table "contract_regions", force: true do |t|
    t.integer "region_id"
    t.integer "contract_id"
  end

  create_table "contracts", force: true do |t|
    t.text     "desc"
    t.integer  "value"
    t.integer  "saving"
    t.string   "contact"
    t.string   "download"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "picture"
    t.integer  "dept_id"
    t.integer  "supplier_id"
    t.string   "region"
  end

  create_table "depts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.boolean  "like"
    t.integer  "user_id"
    t.integer  "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string "name"
  end

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

end
