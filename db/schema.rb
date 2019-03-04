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

ActiveRecord::Schema.define(version: 2019_03_04_154017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attendance_details", force: :cascade do |t|
    t.integer "student_id"
    t.integer "attendance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.date "date_created"
    t.text "comment"
    t.integer "subject_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_enrollments", force: :cascade do |t|
    t.integer "student_id"
    t.integer "subject_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["student_id", "subject_class_id"], name: "index_class_enrollments_on_student_id_and_subject_class_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "email"
    t.string "contact_no"
    t.string "address"
    t.string "gender"
    t.date "birthday"
    t.text "other_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
  end

  create_table "students", force: :cascade do |t|
    t.string "student_no"
    t.string "email"
    t.string "contact_no"
    t.integer "curriculum_year"
    t.integer "year"
    t.string "course"
    t.integer "year_enrolled"
    t.string "gender"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "address"
    t.string "name"
    t.integer "status"
  end

  create_table "subject_classes", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "instructor_id"
    t.string "days"
    t.time "start_time"
    t.time "end_time"
    t.integer "block"
    t.string "school_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sem"
    t.string "room"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "subject_code"
    t.integer "year"
    t.integer "units"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_details", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "test_type"
  end

  create_table "test_results", force: :cascade do |t|
    t.bigint "test_id"
    t.bigint "student_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.datetime "last_time_online"
    t.datetime "time_finished"
    t.string "reason"
    t.index ["student_id"], name: "index_test_results_on_student_id"
    t.index ["test_id"], name: "index_test_results_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.integer "test_type_id"
    t.datetime "schedule"
    t.boolean "is_online"
    t.integer "no_of_items"
    t.integer "subject_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "user_type"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "email"
    t.string "contact_no"
    t.string "address"
    t.string "gender"
    t.date "birthday"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "test_results", "students"
  add_foreign_key "test_results", "tests"
end
