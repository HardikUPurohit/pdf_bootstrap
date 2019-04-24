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

ActiveRecord::Schema.define(version: 2019_04_24_095531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admissions", force: :cascade do |t|
    t.datetime "moment"
    t.bigint "facility_id"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_admissions_on_facility_id"
    t.index ["patient_id"], name: "index_admissions_on_patient_id"
  end

  create_table "allergies", force: :cascade do |t|
    t.text "description"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_allergies_on_patient_id"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "coding_system"
    t.string "code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnosis_admissions", force: :cascade do |t|
    t.bigint "admission_id"
    t.bigint "diagnosis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission_id"], name: "index_diagnosis_admissions_on_admission_id"
    t.index ["diagnosis_id"], name: "index_diagnosis_admissions_on_diagnosis_id"
  end

  create_table "diagnostic_procedures", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_diagnostic_procedures_on_patient_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_orders", force: :cascade do |t|
    t.string "name"
    t.integer "unit"
    t.decimal "dosage"
    t.integer "route"
    t.text "necessity"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_medication_orders_on_patient_id"
  end

  create_table "observations", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.bigint "admission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission_id"], name: "index_observations_on_admission_id"
  end

  create_table "order_frequencies", force: :cascade do |t|
    t.string "value"
    t.integer "unit"
    t.bigint "medication_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medication_order_id"], name: "index_order_frequencies_on_medication_order_id"
  end

  create_table "patient_chronic_conditions", force: :cascade do |t|
    t.bigint "chronic_condition_id"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chronic_condition_id"], name: "index_patient_chronic_conditions_on_chronic_condition_id"
    t.index ["patient_id"], name: "index_patient_chronic_conditions_on_patient_id"
  end

  create_table "patient_diagnoses", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "diagnosis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnosis_id"], name: "index_patient_diagnoses_on_diagnosis_id"
    t.index ["patient_id"], name: "index_patient_diagnoses_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "mr"
    t.datetime "dob"
    t.integer "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.text "description"
    t.bigint "admission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission_id"], name: "index_symptoms_on_admission_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.text "description"
    t.text "necessity"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_treatments_on_patient_id"
  end

  add_foreign_key "admissions", "facilities"
  add_foreign_key "admissions", "patients"
  add_foreign_key "allergies", "patients"
  add_foreign_key "diagnosis_admissions", "admissions"
  add_foreign_key "diagnosis_admissions", "diagnoses"
  add_foreign_key "diagnostic_procedures", "patients"
  add_foreign_key "medication_orders", "patients"
  add_foreign_key "observations", "admissions"
  add_foreign_key "order_frequencies", "medication_orders"
  add_foreign_key "patient_chronic_conditions", "diagnoses", column: "chronic_condition_id"
  add_foreign_key "patient_chronic_conditions", "patients"
  add_foreign_key "patient_diagnoses", "diagnoses"
  add_foreign_key "patient_diagnoses", "patients"
  add_foreign_key "symptoms", "admissions"
  add_foreign_key "treatments", "patients"
end
