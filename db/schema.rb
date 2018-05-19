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

ActiveRecord::Schema.define(version: 20180515083842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dashboard_messages", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean "activity", default: true
    t.string "slug"
    t.index ["slug"], name: "index_dashboard_messages_on_slug", unique: true
  end

  create_table "extra_questions", force: :cascade do |t|
    t.string "question_type"
    t.jsonb "metadata"
    t.boolean "done"
    t.bigint "income_id"
    t.bigint "question_template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_id"], name: "index_extra_questions_on_income_id"
    t.index ["question_template_id"], name: "index_extra_questions_on_question_template_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "incomes", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "salary_or_wage", default: true
    t.boolean "bank_interest", default: true
    t.boolean "centre_link_payment", default: false
    t.boolean "etp", default: false
    t.boolean "superannuation", default: false
    t.boolean "share_dividends", default: false
    t.boolean "sell_any_shares", default: false
    t.boolean "managed_fund", default: false
    t.boolean "trust_or_partnership_distributions", default: false
    t.boolean "foreign_sourced", default: false
    t.boolean "other_income", default: false
    t.boolean "unsure", default: false
    t.string "number_employer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.boolean "activity", default: true
    t.string "unaccented_name"
    t.string "slug"
    t.index ["slug"], name: "index_product_categories_on_slug", unique: true
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "os"
    t.string "language"
    t.string "screen_type"
    t.string "color"
    t.string "resolution"
    t.string "screen_size"
    t.string "font_camera"
    t.string "back_camera"
    t.string "flash"
    t.string "video_mode"
    t.string "video_call"
    t.string "cpu"
    t.string "ram"
    t.string "chipset"
    t.string "address_memory"
    t.string "maximum_memory"
    t.string "built_in_memory"
    t.string "extra_memory"
    t.string "weight"
    t.string "size"
    t.string "battery_capacity"
    t.string "c3g"
    t.string "c4g"
    t.string "bluetooth"
    t.string "gprs"
    t.string "gps"
    t.string "usb"
    t.string "sim_card_port"
    t.string "sim_card"
    t.string "wifi"
    t.string "video_player"
    t.string "mp3_player"
    t.string "fm_radio"
    t.string "recoder"
    t.text "description"
    t.boolean "draft", default: true
    t.integer "product_category_id"
    t.integer "position"
    t.string "title"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "unaccented_name"
    t.string "slug"
    t.index ["slug"], name: "index_product_types_on_slug", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.bigint "product_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "draft", default: true
    t.integer "status"
    t.integer "instalment"
    t.text "description"
    t.integer "position"
    t.string "unaccented_name"
    t.string "slug"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
    t.index ["slug"], name: "index_products_on_slug", unique: true
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.string "attn_if_any"
    t.datetime "dob"
    t.integer "gender", default: 0
    t.string "tax_file_number"
    t.string "confirm_email"
    t.string "email"
    t.string "phone"
    t.string "residental_address"
    t.string "residental_suburb"
    t.string "residental_state"
    t.string "residental_postcode"
    t.string "residental_country"
    t.integer "postal", default: 1
    t.string "postal_address"
    t.string "postal_suburb"
    t.string "postal_state"
    t.string "postal_postcode"
    t.string "postal_country"
    t.integer "preferred_contact_method", default: 1
    t.string "id_type"
    t.string "number"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "question_templates", force: :cascade do |t|
    t.string "question_type"
    t.string "question_text"
    t.boolean "multiple"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "upload_files", force: :cascade do |t|
    t.string "fileable_type"
    t.bigint "fileable_id"
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.index ["fileable_type", "fileable_id"], name: "index_upload_files_on_fileable_type_and_fileable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "extra_questions", "incomes"
  add_foreign_key "extra_questions", "question_templates"
  add_foreign_key "products", "product_types"
end
