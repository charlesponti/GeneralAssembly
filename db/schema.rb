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

ActiveRecord::Schema.define(version: 20130716162627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.integer  "teacher_id"
    t.string   "course_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seats"
  end

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", force: true do |t|
    t.integer  "room_id"
    t.integer  "course_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "time_slot_id"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "address"
    t.string   "email"
    t.string   "student_image"
    t.decimal  "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "password_digest"
    t.string   "username"
  end

  create_table "students_courses", force: true do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "students_courses", ["course_id"], name: "index_students_courses_on_course_id", using: :btree
  add_index "students_courses", ["student_id"], name: "index_students_courses_on_student_id", using: :btree

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.text     "bio"
    t.string   "teacher_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "password_digest"
    t.string   "username"
  end

  create_table "time_slots", force: true do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "day"
    t.string   "slotcode"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "address"
    t.text     "bio"
    t.string   "user_image"
    t.string   "username"
    t.decimal  "balance"
    t.string   "role"
    t.text     "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

end
