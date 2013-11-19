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

ActiveRecord::Schema.define(version: 20131119192521) do

  create_table "answers", id: false, force: true do |t|
    t.integer  "student_id",  null: false
    t.integer  "homework_id", null: false
    t.integer  "page_id",     null: false
    t.text     "content"
    t.string   "status",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["homework_id"], name: "index_answers_on_homework_id"
  add_index "answers", ["page_id"], name: "index_answers_on_page_id"
  add_index "answers", ["status"], name: "index_answers_on_status"
  add_index "answers", ["student_id"], name: "index_answers_on_student_id"

  create_table "assignments", force: true do |t|
    t.integer  "teacher_id",            null: false
    t.integer  "student_id",            null: false
    t.integer  "homework_id",           null: false
    t.integer  "score",       limit: 8, null: false
    t.string   "status",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["homework_id"], name: "index_assignments_on_homework_id"
  add_index "assignments", ["status"], name: "index_assignments_on_status"
  add_index "assignments", ["student_id"], name: "index_assignments_on_student_id"
  add_index "assignments", ["teacher_id"], name: "index_assignments_on_teacher_id"

  create_table "comments", force: true do |t|
    t.integer  "student_id",                     null: false
    t.integer  "homework_id",                    null: false
    t.integer  "page_id",                        null: false
    t.integer  "start_at_character", default: 0, null: false
    t.integer  "ends_at_character",  default: 0, null: false
    t.text     "content"
    t.string   "status",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["homework_id"], name: "index_comments_on_homework_id"
  add_index "comments", ["page_id"], name: "index_comments_on_page_id"
  add_index "comments", ["start_at_character", "ends_at_character"], name: "index_comments_on_start_at_character_and_ends_at_character"
  add_index "comments", ["status"], name: "index_comments_on_status"
  add_index "comments", ["student_id"], name: "index_comments_on_student_id"

  create_table "courses", force: true do |t|
    t.integer  "user_id"
    t.integer  "school_id"
    t.string   "name",       null: false
    t.string   "level",      null: false
    t.string   "year",       null: false
    t.string   "status",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["level", "year"], name: "index_courses_on_level_and_year"
  add_index "courses", ["school_id", "name"], name: "index_courses_on_school_id_and_name", unique: true
  add_index "courses", ["school_id"], name: "index_courses_on_school_id"
  add_index "courses", ["status"], name: "index_courses_on_status"
  add_index "courses", ["user_id"], name: "index_courses_on_user_id"

  create_table "employees", id: false, force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "school_id",    null: false
    t.string   "relationship", null: false
    t.string   "status",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["relationship"], name: "index_employees_on_relationship"
  add_index "employees", ["school_id"], name: "index_employees_on_school_id"
  add_index "employees", ["status"], name: "index_employees_on_status"
  add_index "employees", ["user_id", "school_id"], name: "index_employees_on_user_id_and_school_id", unique: true
  add_index "employees", ["user_id"], name: "index_employees_on_user_id"

  create_table "friendships", id: false, force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "friend_id",    null: false
    t.string   "relationship", null: false
    t.string   "status",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id"
  add_index "friendships", ["relationship"], name: "index_friendships_on_relationship"
  add_index "friendships", ["status"], name: "index_friendships_on_status"
  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "homeworks", force: true do |t|
    t.integer  "teacher_id", null: false
    t.integer  "course_id",  null: false
    t.string   "activity",   null: false
    t.string   "title",      null: false
    t.text     "content"
    t.string   "status",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "homeworks", ["activity"], name: "index_homeworks_on_activity"
  add_index "homeworks", ["course_id"], name: "index_homeworks_on_course_id"
  add_index "homeworks", ["status"], name: "index_homeworks_on_status"
  add_index "homeworks", ["teacher_id"], name: "index_homeworks_on_teacher_id"
  add_index "homeworks", ["title"], name: "index_homeworks_on_title"

  create_table "pages", force: true do |t|
    t.integer  "homework_id"
    t.string   "title",       null: false
    t.text     "content"
    t.string   "status",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["homework_id"], name: "index_pages_on_homework_id"
  add_index "pages", ["status"], name: "index_pages_on_status"

  create_table "schools", force: true do |t|
    t.string   "name",       null: false
    t.text     "address"
    t.float    "latitude",   null: false
    t.float    "longitude",  null: false
    t.string   "url",        null: false
    t.string   "picture"
    t.string   "status",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["name"], name: "index_schools_on_name", unique: true
  add_index "schools", ["picture"], name: "index_schools_on_picture"
  add_index "schools", ["status"], name: "index_schools_on_status"
  add_index "schools", ["url"], name: "index_schools_on_url"

  create_table "subscriptions", id: false, force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "course_id",    null: false
    t.string   "relationship", null: false
    t.string   "status",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["course_id"], name: "index_subscriptions_on_course_id"
  add_index "subscriptions", ["relationship"], name: "index_subscriptions_on_relationship"
  add_index "subscriptions", ["status"], name: "index_subscriptions_on_status"
  add_index "subscriptions", ["user_id", "course_id"], name: "index_subscriptions_on_user_id_and_course_id", unique: true
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "document_id",   null: false
    t.string   "first_name",    null: false
    t.string   "last_name",     null: false
    t.date     "date_of_birth"
    t.string   "picture",       null: false
    t.string   "background",    null: false
    t.string   "status",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["document_id"], name: "index_users_on_document_id", unique: true
  add_index "users", ["first_name", "last_name"], name: "index_users_on_first_name_and_last_name"
  add_index "users", ["status"], name: "index_users_on_status"

end
