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

ActiveRecord::Schema.define(version: 20140404051757) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "answer_files", force: true do |t|
    t.integer  "answer_id"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  add_index "answer_files", ["answer_id"], name: "index_answer_files_on_answer_id", using: :btree
  add_index "answer_files", ["user_id"], name: "index_answer_files_on_user_id", using: :btree

  create_table "answers", force: true do |t|
    t.integer  "user_id"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "departments", force: true do |t|
    t.integer  "school_id"
    t.string   "name"
    t.string   "kind"
    t.string   "prefecture"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["kind"], name: "index_departments_on_kind", using: :btree
  add_index "departments", ["prefecture"], name: "index_departments_on_prefecture", using: :btree
  add_index "departments", ["school_id"], name: "index_departments_on_school_id", using: :btree

  create_table "schools", force: true do |t|
    t.string   "type"
    t.string   "establishment"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "prefecture"
    t.string   "address"
  end

  add_index "schools", ["establishment"], name: "index_schools_on_establishment", using: :btree
  add_index "schools", ["name"], name: "index_schools_on_name", using: :btree
  add_index "schools", ["type"], name: "index_schools_on_type", using: :btree

  create_table "users", force: true do |t|
    t.string   "nickname"
    t.string   "email",                  default: "", null: false
    t.integer  "graduate_year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "school"
    t.string   "department"
  end

  add_index "users", ["department"], name: "index_users_on_department", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["school"], name: "index_users_on_school", using: :btree

  create_table "wish_universities", force: true do |t|
    t.integer  "user_id"
    t.integer  "university_id"
    t.integer  "department_id"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wish_universities", ["department_id"], name: "index_wish_universities_on_department_id", using: :btree
  add_index "wish_universities", ["university_id"], name: "index_wish_universities_on_university_id", using: :btree
  add_index "wish_universities", ["user_id"], name: "index_wish_universities_on_user_id", using: :btree

end
