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

ActiveRecord::Schema.define(version: 20160421160333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_areas", force: :cascade do |t|
    t.string   "name"
    t.string   "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "academic_areas", ["locale"], name: "index_academic_areas_on_locale", using: :btree

  create_table "academic_degrees", force: :cascade do |t|
    t.string   "name"
    t.string   "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "academic_degrees", ["locale"], name: "index_academic_degrees_on_locale", using: :btree

  create_table "academic_experiences", force: :cascade do |t|
    t.string   "degree"
    t.string   "institution"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "minimum_grade"
    t.string   "maximum_grade"
    t.string   "actual_grade"
    t.string   "country_code"
    t.string   "city"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "deleted_at"
    t.boolean  "current"
    t.integer  "academic_degree_id"
    t.integer  "academic_area_id"
  end

  add_index "academic_experiences", ["academic_area_id"], name: "index_academic_experiences_on_academic_area_id", using: :btree
  add_index "academic_experiences", ["academic_degree_id"], name: "index_academic_experiences_on_academic_degree_id", using: :btree
  add_index "academic_experiences", ["city"], name: "index_academic_experiences_on_city", using: :btree
  add_index "academic_experiences", ["country_code"], name: "index_academic_experiences_on_country_code", using: :btree
  add_index "academic_experiences", ["deleted_at"], name: "index_academic_experiences_on_deleted_at", using: :btree
  add_index "academic_experiences", ["user_id"], name: "index_academic_experiences_on_user_id", using: :btree

  create_table "academic_skills", force: :cascade do |t|
    t.integer  "academic_experience_id"
    t.integer  "skill_id"
    t.integer  "level",                  default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.datetime "deleted_at"
  end

  add_index "academic_skills", ["academic_experience_id"], name: "index_academic_skills_on_academic_experience_id", using: :btree
  add_index "academic_skills", ["deleted_at"], name: "index_academic_skills_on_deleted_at", using: :btree
  add_index "academic_skills", ["skill_id"], name: "index_academic_skills_on_skill_id", using: :btree

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  add_index "accounts", ["deleted_at"], name: "index_accounts_on_deleted_at", using: :btree

  create_table "admins", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["uid", "provider"], name: "index_admins_on_uid_and_provider", unique: true, using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "cc_iso"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "info"
    t.integer  "privacy",          default: 0
    t.integer  "contact_type",     default: 0
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.datetime "deleted_at"
  end

  add_index "contacts", ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable_type_and_contactable_id", using: :btree
  add_index "contacts", ["deleted_at"], name: "index_contacts_on_deleted_at", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "cc_fips"
    t.string   "cc_iso"
    t.string   "tld"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extra_activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_languages", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "language_id"
    t.integer  "level"
    t.boolean  "required",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "job_languages", ["job_id"], name: "index_job_languages_on_job_id", using: :btree
  add_index "job_languages", ["language_id"], name: "index_job_languages_on_language_id", using: :btree

  create_table "job_requirements", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "academic_area_id"
    t.integer  "academic_degree_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "job_requirements", ["academic_area_id"], name: "index_job_requirements_on_academic_area_id", using: :btree
  add_index "job_requirements", ["academic_degree_id"], name: "index_job_requirements_on_academic_degree_id", using: :btree
  add_index "job_requirements", ["job_id"], name: "index_job_requirements_on_job_id", using: :btree

  create_table "job_skills", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "skill_id"
    t.integer  "level"
    t.boolean  "required",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "job_skills", ["job_id"], name: "index_job_skills_on_job_id", using: :btree
  add_index "job_skills", ["skill_id"], name: "index_job_skills_on_skill_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "minimum_years"
    t.string   "desired_years"
    t.string   "desired_personality"
    t.string   "country_code"
    t.string   "city"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "jobs", ["city"], name: "index_jobs_on_city", using: :btree
  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree
  add_index "jobs", ["country_code"], name: "index_jobs_on_country_code", using: :btree

  create_table "language_levels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.integer  "level",       default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.datetime "deleted_at"
  end

  add_index "language_levels", ["deleted_at"], name: "index_language_levels_on_deleted_at", using: :btree
  add_index "language_levels", ["language_id"], name: "index_language_levels_on_language_id", using: :btree
  add_index "language_levels", ["user_id"], name: "index_language_levels_on_user_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "locale"
  end

  add_index "languages", ["locale"], name: "index_languages_on_locale", using: :btree

  create_table "oauth_providers", force: :cascade do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  add_index "oauth_providers", ["deleted_at"], name: "index_oauth_providers_on_deleted_at", using: :btree
  add_index "oauth_providers", ["user_id"], name: "index_oauth_providers_on_user_id", using: :btree

  create_table "professional_experiences", force: :cascade do |t|
    t.string   "position"
    t.string   "organization"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "country_code"
    t.string   "city"
    t.boolean  "current",                 default: false
    t.integer  "user_id"
    t.integer  "sector_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.datetime "deleted_at"
    t.integer  "responsibility_level_id"
    t.string   "organization_size"
    t.boolean  "is_startup",              default: true
  end

  add_index "professional_experiences", ["city"], name: "index_professional_experiences_on_city", using: :btree
  add_index "professional_experiences", ["country_code"], name: "index_professional_experiences_on_country_code", using: :btree
  add_index "professional_experiences", ["deleted_at"], name: "index_professional_experiences_on_deleted_at", using: :btree
  add_index "professional_experiences", ["responsibility_level_id"], name: "index_professional_experiences_on_responsibility_level_id", using: :btree
  add_index "professional_experiences", ["sector_id"], name: "index_professional_experiences_on_sector_id", using: :btree
  add_index "professional_experiences", ["user_id"], name: "index_professional_experiences_on_user_id", using: :btree

  create_table "professional_skills", force: :cascade do |t|
    t.integer  "professional_experience_id"
    t.integer  "skill_id"
    t.integer  "level",                      default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.datetime "deleted_at"
  end

  add_index "professional_skills", ["deleted_at"], name: "index_professional_skills_on_deleted_at", using: :btree
  add_index "professional_skills", ["professional_experience_id"], name: "index_professional_skills_on_professional_experience_id", using: :btree
  add_index "professional_skills", ["skill_id"], name: "index_professional_skills_on_skill_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "born_date"
    t.integer  "user_id"
    t.string   "country_code"
    t.string   "city"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.datetime "deleted_at"
    t.boolean  "driver_license",    default: true
    t.boolean  "currently_work",    default: false
    t.boolean  "previously_worked", default: false
    t.integer  "desired_sector_id"
  end

  add_index "profiles", ["city"], name: "index_profiles_on_city", using: :btree
  add_index "profiles", ["country_code"], name: "index_profiles_on_country_code", using: :btree
  add_index "profiles", ["deleted_at"], name: "index_profiles_on_deleted_at", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "responsibility_levels", force: :cascade do |t|
    t.string   "name"
    t.string   "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "locale"
  end

  add_index "sectors", ["locale"], name: "index_sectors_on_locale", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "locale",     default: "en"
  end

  add_index "skills", ["locale"], name: "index_skills_on_locale", using: :btree

  create_table "test_results", force: :cascade do |t|
    t.integer  "extraversion", default: 0
    t.integer  "intuition",    default: 0
    t.integer  "feeling",      default: 0
    t.integer  "perceiving",   default: 0
    t.integer  "introversion", default: 0
    t.integer  "sensing",      default: 0
    t.integer  "thinking",     default: 0
    t.integer  "judging",      default: 0
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.datetime "deleted_at"
    t.boolean  "complete",     default: false
    t.string   "step"
    t.string   "result"
  end

  add_index "test_results", ["deleted_at"], name: "index_test_results_on_deleted_at", using: :btree
  add_index "test_results", ["user_id"], name: "index_test_results_on_user_id", using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "rank_2014"
    t.string   "rank_2013"
    t.string   "score_2015"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_extra_activities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "extra_activity_id"
    t.integer  "level",             default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "deleted_at"
  end

  add_index "user_extra_activities", ["deleted_at"], name: "index_user_extra_activities_on_deleted_at", using: :btree
  add_index "user_extra_activities", ["extra_activity_id"], name: "index_user_extra_activities_on_extra_activity_id", using: :btree
  add_index "user_extra_activities", ["user_id"], name: "index_user_extra_activities_on_user_id", using: :btree

  create_table "user_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.integer  "level",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "deleted_at"
  end

  add_index "user_skills", ["deleted_at"], name: "index_user_skills_on_deleted_at", using: :btree
  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id", using: :btree
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "account_id"
    t.integer  "role_id",                default: 1
    t.string   "registration_step"
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id", using: :btree
  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  add_foreign_key "academic_experiences", "academic_areas"
  add_foreign_key "academic_experiences", "academic_degrees"
  add_foreign_key "academic_experiences", "users"
  add_foreign_key "academic_skills", "academic_experiences"
  add_foreign_key "academic_skills", "skills"
  add_foreign_key "job_languages", "jobs"
  add_foreign_key "job_languages", "languages"
  add_foreign_key "job_requirements", "academic_areas"
  add_foreign_key "job_requirements", "academic_degrees"
  add_foreign_key "job_requirements", "jobs"
  add_foreign_key "job_skills", "jobs"
  add_foreign_key "job_skills", "skills"
  add_foreign_key "jobs", "companies"
  add_foreign_key "language_levels", "languages"
  add_foreign_key "language_levels", "users"
  add_foreign_key "oauth_providers", "users"
  add_foreign_key "professional_experiences", "sectors"
  add_foreign_key "professional_experiences", "users"
  add_foreign_key "professional_skills", "professional_experiences"
  add_foreign_key "professional_skills", "skills"
  add_foreign_key "profiles", "users"
  add_foreign_key "test_results", "users"
  add_foreign_key "user_extra_activities", "extra_activities"
  add_foreign_key "user_extra_activities", "users"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "users"
end
