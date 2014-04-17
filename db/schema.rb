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

ActiveRecord::Schema.define(version: 20140417122608) do

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "course"
    t.integer  "number_of_students"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_subjects", id: false, force: true do |t|
    t.integer "group_id"
    t.integer "subject_id"
  end

  add_index "groups_subjects", ["group_id"], name: "index_groups_subjects_on_group_id"
  add_index "groups_subjects", ["subject_id"], name: "index_groups_subjects_on_subject_id"

  create_table "misses", force: true do |t|
    t.integer  "student_id"
    t.integer  "pair_id"
    t.integer  "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "misses", ["student_id"], name: "index_misses_on_student_id"

  create_table "pairs", force: true do |t|
    t.integer  "subject_id"
    t.date     "today"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "pairs", ["group_id"], name: "index_pairs_on_group_id"
  add_index "pairs", ["subject_id"], name: "index_pairs_on_subject_id"

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["group_id"], name: "index_students_on_group_id"

  create_table "subjects", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects_teachers", id: false, force: true do |t|
    t.integer "subject_id"
    t.integer "teacher_id"
  end

  add_index "subjects_teachers", ["subject_id"], name: "index_subjects_teachers_on_subject_id"
  add_index "subjects_teachers", ["teacher_id"], name: "index_subjects_teachers_on_teacher_id"

  create_table "teachers", force: true do |t|
    t.string   "academic_degree"
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "patronymic"
  end

end
