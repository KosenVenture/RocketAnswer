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

ActiveRecord::Schema.define(version: 20170821095515) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "answer_files", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "answer_id"
    t.bigint "user_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["answer_id"], name: "index_answer_files_on_answer_id"
    t.index ["user_id"], name: "index_answer_files_on_user_id"
  end

  create_table "answer_stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "answer_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_stocks_on_answer_id"
    t.index ["user_id"], name: "index_answer_stocks_on_user_id"
  end

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
    t.string "subject"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "answer_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_comments_on_answer_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "school_id"
    t.string "name"
    t.string "kind"
    t.string "prefecture"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind"], name: "index_departments_on_kind"
    t.index ["prefecture"], name: "index_departments_on_prefecture"
    t.index ["school_id"], name: "index_departments_on_school_id"
  end

  create_table "exp_stories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "is_passed", default: false, null: false
    t.integer "year"
    t.text "self_intro"
    t.text "advice"
    t.text "motivation"
    t.text "exam"
    t.text "interview"
    t.text "textbook"
    t.string "way"
    t.string "grad_school"
    t.string "grad_department"
    t.bigint "department_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_exp_stories_on_department_id"
    t.index ["user_id"], name: "index_exp_stories_on_user_id"
  end

  create_table "schools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type"
    t.string "establishment"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prefecture"
    t.string "address"
    t.index ["establishment"], name: "index_schools_on_establishment"
    t.index ["name"], name: "index_schools_on_name"
    t.index ["type"], name: "index_schools_on_type"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nickname"
    t.string "email", default: "", null: false
    t.integer "graduate_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "school"
    t.string "department"
    t.index ["department"], name: "index_users_on_department"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school"], name: "index_users_on_school"
  end

  create_table "wish_universities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "university_id"
    t.bigint "department_id"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_wish_universities_on_department_id"
    t.index ["university_id"], name: "index_wish_universities_on_university_id"
    t.index ["user_id"], name: "index_wish_universities_on_user_id"
  end

  add_foreign_key "exp_stories", "departments"
  add_foreign_key "exp_stories", "users"
end
