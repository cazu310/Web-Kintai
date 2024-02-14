# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_12_131958) do
  create_table "attendance_records", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.date "work_date"
    t.time "clock_in_time"
    t.time "clock_out_time"
    t.decimal "working_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_attendance_records_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "login_id"
    t.string "bank_account"
    t.integer "position_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_employees_on_position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.decimal "hourly_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.decimal "monthly_salary"
    t.decimal "hourly_wage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_salaries_on_employee_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_sessions_on_employee_id"
  end

  add_foreign_key "attendance_records", "employees"
  add_foreign_key "attendance_records", "employees"
  add_foreign_key "employees", "positions"
  add_foreign_key "salaries", "employees"
  add_foreign_key "sessions", "employees"
end
