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

ActiveRecord::Schema.define(version: 20160203083307) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "period_id"
    t.boolean  "attended"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendances", ["period_id"], name: "index_attendances_on_period_id"
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id"

  create_table "contact_lists", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "temp",       default: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "phone"
    t.string   "additional_phone"
    t.string   "skype"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id"

  create_table "course_elements", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "theme"
    t.string   "element_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "course_elements", ["course_id"], name: "index_course_elements_on_course_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.date     "starts_at"
    t.date     "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_lists", force: :cascade do |t|
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "contact_list_id"
  end

  add_index "custom_lists", ["contact_list_id"], name: "index_custom_lists_on_contact_list_id"

  create_table "group_memberships", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_memberships", ["group_id"], name: "index_group_memberships_on_group_id"
  add_index "group_memberships", ["user_id"], name: "index_group_memberships_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["course_id"], name: "index_groups_on_course_id"

  create_table "homeworks", force: :cascade do |t|
    t.text     "review"
    t.decimal  "rating"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "hw_archive_file_name"
    t.string   "hw_archive_content_type"
    t.integer  "hw_archive_file_size"
    t.datetime "hw_archive_updated_at"
    t.integer  "period_id"
  end

  add_index "homeworks", ["period_id"], name: "index_homeworks_on_period_id"

  create_table "periods", force: :cascade do |t|
    t.integer  "course_elements_id"
    t.string   "title"
    t.datetime "commence_datetime"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "group_id"
    t.integer  "course_id"
  end

  add_index "periods", ["course_elements_id"], name: "index_periods_on_course_elements_id"
  add_index "periods", ["course_id"], name: "index_periods_on_course_id"
  add_index "periods", ["group_id"], name: "index_periods_on_group_id"

  create_table "recipient_depositories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contact_list_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "recipient_depositories", ["contact_list_id"], name: "index_recipient_depositories_on_contact_list_id"
  add_index "recipient_depositories", ["user_id"], name: "index_recipient_depositories_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "senders", force: :cascade do |t|
    t.string   "name"
    t.integer  "sms_service_account_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "senders", ["sms_service_account_id"], name: "index_senders_on_sms_service_account_id"

  create_table "sms_deliveries", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "sender_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "contact_list_id"
    t.boolean  "status",          default: false
    t.datetime "delivery_time"
  end

  add_index "sms_deliveries", ["contact_list_id"], name: "index_sms_deliveries_on_contact_list_id"
  add_index "sms_deliveries", ["sender_id"], name: "index_sms_deliveries_on_sender_id"

  create_table "sms_service_accounts", force: :cascade do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.date     "birthdate"
    t.string   "gender"
    t.string   "passport_data"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "email",                           default: "", null: false
    t.string   "encrypted_password",              default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "passport_scan_copy_file_name"
    t.string   "passport_scan_copy_content_type"
    t.integer  "passport_scan_copy_file_size"
    t.datetime "passport_scan_copy_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
