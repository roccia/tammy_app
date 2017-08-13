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

ActiveRecord::Schema.define(version: 20170809170333) do

  create_table "activities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "trackable_id"
    t.string "trackable_type"
    t.integer "owner_id"
    t.string "owner_type"
    t.string "key"
    t.text "parameters"
    t.integer "recipient_id"
    t.string "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
  end

  create_table "admin_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.string "summary"
    t.text "content"
  end

  create_table "admins", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
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
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name", default: "", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
    t.boolean "is_active"
    t.string "mobile_number"
    t.string "character"
    t.string "ding_id"
    t.integer "sale_type"
    t.integer "department_id"
    t.boolean "sensitive_info"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "admins_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer "admin_id"
    t.integer "role_id"
    t.index ["admin_id", "role_id"], name: "index_admins_roles_on_admin_id_and_role_id"
  end

  create_table "async_processors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.text "options"
    t.text "response_hash"
    t.boolean "success"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_async_processors_on_user_id"
  end

  create_table "auto_reject_white_lists", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "white_listable_id"
    t.string "white_listable_type"
    t.integer "limitable_id"
    t.string "limitable_type"
    t.datetime "expired_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["white_listable_type", "white_listable_id"], name: "idx_auto_reject_white_lists_on_white_listable", length: { white_listable_type: 50 }
  end

  create_table "bank_area_codes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "area_id"
    t.string "name"
    t.string "bank_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "parent_id"
  end

  create_table "bank_card_snapshots", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "bank_card_owner_id"
    t.string "bank_card_number"
    t.string "deposit_bank"
    t.string "note"
    t.string "receiving_company"
    t.integer "account_type"
    t.string "receiver_authorization_file"
    t.string "artificial_person_id_card_front"
    t.string "artificial_person_id_card_back"
    t.string "receiver_id_card_front"
    t.string "receiver_id_card_back"
    t.string "receiver_bankcard_photo"
    t.string "deposit_bank_code"
    t.integer "bank_id"
    t.string "legal_person_idcard"
    t.string "legal_person_mobile"
    t.string "legal_person_name"
    t.string "third_receive_enabled"
    t.string "bank_card_owner_type"
    t.string "type_name"
    t.string "position"
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bank_cards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer "bank_card_owner_id"
    t.string "bank_card_number"
    t.string "deposit_bank"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "receiving_company"
    t.integer "account_type"
    t.string "receiver_authorization_file"
    t.string "artificial_person_id_card_front"
    t.string "artificial_person_id_card_back"
    t.string "receiver_id_card_front"
    t.string "receiver_id_card_back"
    t.string "receiver_bankcard_photo"
    t.text "deposit_bank_code"
    t.integer "bank_id"
    t.string "legal_person_idcard"
    t.string "legal_person_mobile"
    t.string "legal_person_name"
    t.boolean "third_receive_enabled"
    t.string "bank_card_owner_type"
    t.string "type_name"
    t.string "position"
    t.string "mobile_number"
    t.index ["bank_card_owner_id"], name: "index_bank_cards_on_bank_card_owner_id"
  end

  create_table "banks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "logo"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sort"
    t.integer "valid_status"
    t.string "jiufu_code"
    t.string "bank_abbre"
    t.string "color"
    t.boolean "hospital_visible", default: true
  end

  create_table "bill_notes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "bill_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_notes_on_bill_id"
  end

  create_table "bills", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer "user_id"
    t.integer "installment_id"
    t.integer "year"
    t.integer "month"
    t.integer "bill_status"
    t.datetime "repay_date"
    t.decimal "amount", precision: 8, scale: 2
    t.integer "period_number"
    t.integer "current_period"
    t.decimal "repay_amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "overdue_amount", precision: 10, scale: 2
    t.datetime "repayed_at"
    t.integer "repayed_mode"
    t.decimal "interest_amount", precision: 8, scale: 2
    t.decimal "service_fee_amount", precision: 8, scale: 2
    t.integer "repayed_channel"
    t.decimal "balance_amount", precision: 8, scale: 2
    t.integer "overdue_days"
    t.string "after_loan_note"
    t.integer "offline_status"
    t.integer "max_age", default: 0
    t.datetime "deleted_at"
    t.string "type"
    t.boolean "freed_interest"
    t.index ["deleted_at"], name: "index_bills_on_deleted_at"
    t.index ["installment_id"], name: "index_bills_on_installment_id"
  end

  create_table "bootsy_image_galleries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "bootsy_resource_id"
    t.string "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image_file"
    t.integer "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_records", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "content"
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bill_id"
  end

  create_table "calls", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.text "logs", limit: 4294967295
    t.text "contacts", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "captcha_records", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "code"
    t.string "vcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_protocols", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.string "card_mobile"
    t.string "card_number"
    t.string "bind_protocol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "card_bank"
    t.string "message_no"
    t.string "bind_name"
    t.string "bind_bank_name"
    t.integer "bank_id"
    t.integer "vendor_id"
    t.string "sign_id"
    t.string "contact_no"
    t.string "jiufu_protocol_id"
    t.integer "binding_info"
    t.integer "status"
  end

  create_table "categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "subtitle"
    t.string "cover_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "background_color"
  end

  create_table "channel_configs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "channel_id"
    t.string "installment_url"
    t.string "token"
    t.string "sms_title"
    t.string "service_phone"
    t.string "review_supplement_url"
    t.boolean "auto_withdrawal", default: false
    t.boolean "security_deposit_config_enabled"
    t.integer "refund_free_days"
    t.integer "refund_buffer_days"
    t.float "refund_buffer_money_ratio", limit: 24
    t.integer "can_refund_days"
    t.index ["channel_id"], name: "index_channel_configs_on_channel_id", unique: true
  end

  create_table "channels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "channel_code"
    t.integer "num_sn"
    t.index ["channel_code"], name: "index_channels_on_channel_code", unique: true
    t.index ["num_sn"], name: "index_channels_on_num_sn", unique: true
  end

  create_table "cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comm_login_results", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.boolean "success"
    t.string "token"
    t.string "website"
    t.datetime "login_at"
    t.text "original"
    t.string "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_comm_login_results_on_user_id"
  end

  create_table "comm_verify_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.text "options"
    t.text "response_hash"
    t.boolean "success", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "type"
    t.string "task_key"
  end

  create_table "consignees", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.string "name"
    t.string "mobile"
    t.string "address"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "district_id"
  end

  create_table "coupons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "cover_url"
    t.string "title"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "valid_time"
    t.integer "coupon_status"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.integer "coupon_type"
    t.integer "redeem_code_id"
  end

  create_table "credits", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "idcard_front"
    t.string "idcard_back"
    t.string "idcard_number"
    t.string "mail"
    t.string "address"
    t.integer "is_working"
    t.integer "educational_degree"
    t.string "university_name"
    t.integer "enrollment_year"
    t.integer "occupation"
    t.integer "position"
    t.string "company_name"
    t.string "company_telephone"
    t.string "card_owner"
    t.string "card_number"
    t.integer "card_bank"
    t.string "deposit_bank"
    t.string "card_mobile"
    t.string "contact_name"
    t.string "contact_mobile"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "district_id"
    t.string "company_address"
    t.string "company_district_id"
    t.integer "house_type"
    t.string "college"
    t.string "major"
    t.boolean "full_time"
    t.integer "graduation_year"
    t.integer "studying_time"
    t.string "student_id"
    t.string "mobile_service"
    t.integer "mobile_status"
    t.integer "contact_relation"
    t.integer "card_protocol_id"
    t.boolean "agree_protocal"
    t.integer "marital_status"
    t.string "company_contact_name"
    t.string "company_contact_phone"
    t.string "university_district_id"
    t.string "company_contact_name2"
    t.string "company_contact_phone2"
    t.datetime "mobile_verified_at"
    t.string "jxl_token"
    t.string "wechat_id"
    t.string "credit_card"
    t.string "saving_card"
    t.string "card_mobile2"
    t.string "fake_mail"
    t.string "bank_code"
    t.string "rong360_token"
    t.integer "last_static_score"
    t.integer "credit_auth_status"
    t.index ["card_protocol_id"], name: "index_credits_on_card_protocol_id"
    t.index ["user_id"], name: "index_credits_on_user_id"
  end

  create_table "dc_hospitals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "hospital_id"
    t.integer "installments_total"
    t.integer "installments_loaned"
    t.integer "installments_passed"
    t.integer "installments_approved_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dc_statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.datetime "installments_lasy_dc_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dc_weeklies", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text "weekly", limit: 4294967295
    t.text "totally", limit: 4294967295
    t.datetime "begin_time"
    t.datetime "end_time"
    t.integer "week_of_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "manager_id"
    t.index ["lft"], name: "index_departments_on_lft"
    t.index ["parent_id"], name: "index_departments_on_parent_id"
    t.index ["rgt"], name: "index_departments_on_rgt"
  end

  create_table "devices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.string "uid"
    t.string "brand"
    t.string "model"
    t.string "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ding_configs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "access_token"
    t.datetime "token_time"
    t.string "ticket"
    t.datetime "ticket_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "official_id"
    t.string "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.integer "hospital_id"
    t.boolean "authorized"
    t.string "major_skills"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.text "content", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financial_product_items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "financial_product_id"
    t.integer "total_period"
    t.decimal "month_interest_percent", precision: 6, scale: 4, default: "0.0"
    t.decimal "month_service_fee_percent", precision: 6, scale: 4, default: "0.0"
    t.decimal "mch_subsidy_percent", precision: 6, scale: 4, default: "0.0"
    t.decimal "bill_month_interest_percent", precision: 10, scale: 8, default: "0.0"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "jiufu_code"
    t.integer "repayment_type"
    t.integer "protocol_version"
    t.index ["financial_product_id", "total_period"], name: "idx_financial_product_items_on_fpid_and_period", unique: true
  end

  create_table "financial_products", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "protocol_version"
    t.string "notes"
    t.string "sale_channel"
    t.boolean "internal"
    t.boolean "can_extend", default: false
  end

  create_table "focus_pictures", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "url"
    t.integer "jump_type"
    t.string "jump_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "focus"
  end

  create_table "fuyou_accounts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.string "name"
    t.string "mobile_number"
    t.string "bank_city_code"
    t.string "bank_code"
    t.string "card_number"
    t.boolean "success", default: false
    t.string "err_msg"
    t.string "type"
    t.string "fuyou_accountable_type"
    t.integer "fuyou_accountable_id"
    t.integer "bank_id"
    t.string "deposit_bank"
    t.string "idcard_no"
    t.string "card_mobile"
    t.text "extra_infos"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "enabled", default: true
    t.index ["fuyou_accountable_type", "fuyou_accountable_id"], name: "idx_fuyou_accounts_on_fuyou_accountable"
  end

  create_table "hongbao_issue_statistics", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "desc"
    t.integer "hospital_channel_id"
    t.integer "hospital_hongbao_config_id"
    t.integer "receive_number"
    t.integer "status", default: 0
    t.datetime "effect_time"
    t.datetime "stop_time"
    t.datetime "first_active_time"
    t.float "total_amount", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hongbao_template_snapshots", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "installment_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hongbaos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.float "money", limit: 24
    t.integer "status"
    t.integer "installment_id"
    t.string "openid"
    t.integer "reward_type"
    t.text "wx_params"
    t.text "wx_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hongbao_issue_statistic_id"
    t.index ["installment_id"], name: "index_hongbaos_on_installment_id", unique: true
  end

  create_table "hospital_attaches", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "loan_amount", precision: 10, scale: 2
    t.integer "hospital_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospital_channel_statistics", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "month_in"
    t.integer "month_out"
    t.integer "history_in"
    t.integer "history_out"
    t.decimal "history_loan_amount", precision: 10, scale: 2
    t.integer "today_overdue"
    t.integer "month_overdue"
    t.integer "history_overdue"
    t.integer "today_refund"
    t.integer "history_refund"
    t.integer "hospital_channel_id"
    t.datetime "last_summary_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospital_channels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "hospital_id"
    t.integer "owner_id"
    t.integer "operator_id"
    t.string "channel_name"
    t.integer "hongbao_id"
    t.integer "hongbao_state"
    t.datetime "hongbao_auto_open_time"
    t.datetime "online_at"
    t.datetime "offline_at"
    t.integer "channel_id"
    t.integer "valid_status"
    t.datetime "hongbao_auto_close_time"
    t.integer "hongbao_enabled"
    t.integer "enabled"
    t.decimal "security_deposit_ratio", precision: 6, scale: 5, default: "0.0"
    t.boolean "auto_withdrawal"
    t.decimal "private_withdraw_fee_ratio", precision: 6, scale: 5, default: "0.0"
    t.boolean "security_deposit_enabled"
    t.string "wc_qrcode_ticket"
  end

  create_table "hospital_dynamic_scores", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "hospital_id"
    t.float "installment_count_per_week", limit: 24
    t.float "installment_money_sum_per_week", limit: 24
    t.string "score_str"
    t.integer "score"
    t.integer "max_age"
    t.integer "max_overdue_days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "manual_score"
    t.float "m1_overdued_of_approved", limit: 24
    t.float "m2_overdued_of_approved", limit: 24
    t.float "m3_plus_overdued_of_approved", limit: 24
    t.float "passed_per_total", limit: 24
  end

  create_table "hospital_financial_products", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer "hospital_id"
    t.integer "financial_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hospital_channel_id"
    t.index ["hospital_channel_id"], name: "index_hospital_financial_products_on_hospital_channel_id", unique: true
  end

  create_table "hospital_group_members", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "hospital_id"
    t.integer "hospital_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospital_groups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "desc"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospital_hongbao_configs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.integer "user_custom"
    t.integer "first_type"
    t.integer "other_type"
    t.decimal "first_range_low", precision: 6, scale: 2
    t.decimal "first_range_high", precision: 6, scale: 2
    t.decimal "other_range_low", precision: 6, scale: 2
    t.decimal "other_range_high", precision: 6, scale: 2
    t.decimal "first_percent", precision: 6, scale: 4
    t.decimal "other_percent", precision: 6, scale: 4
  end

  create_table "hospital_personal_accounts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "hospital_id"
    t.integer "bank_id"
    t.string "bank_city_code"
    t.string "card_number"
    t.string "name"
    t.string "card_mobile"
    t.string "idcard_no"
    t.boolean "success", default: false
    t.string "err_msg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mobile_number"
    t.string "deposit_bank"
    t.index ["hospital_id"], name: "index_hospital_personal_accounts_on_hospital_id", unique: true
  end

  create_table "hospital_rebate_settlements", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "hospital_id"
    t.integer "hospital_channel_id"
    t.integer "channel_id"
    t.integer "bd_id"
    t.date "settlement_date"
    t.integer "trigger_type"
    t.integer "strategy_snapshot_id"
    t.integer "loaned_count"
    t.decimal "approved_amount", precision: 10, scale: 2
    t.decimal "rebate_amount", precision: 10, scale: 2
    t.integer "settlement_status"
    t.integer "financial_product_id"
    t.datetime "settled_at"
    t.string "receipt_file"
    t.string "voucher_file"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_channel_id", "settlement_date"], name: "settlements_unique_index", unique: true
  end

  create_table "hospital_rebate_strategies", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "hospital_id"
    t.integer "hospital_channel_id"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer "rebate_type"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value_type"
  end

  create_table "hospital_rebate_strategy_item_snapshots", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "hospital_rebate_strategy_id"
    t.integer "value_type"
    t.decimal "value", precision: 10, scale: 3
    t.decimal "range_begin", precision: 10, scale: 2
    t.decimal "range_end", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospital_rebate_strategy_items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "hospital_rebate_strategy_id"
    t.integer "value_type"
    t.decimal "value", precision: 10, scale: 4
    t.decimal "range_begin", precision: 10, scale: 2
    t.decimal "range_end", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospital_rebate_strategy_snapshots", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "hospital_id"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer "rebate_type"
    t.string "remark"
    t.integer "value_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hospital_channel_id"
  end

  create_table "hospital_rebates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer "hospital_id"
    t.datetime "started_at"
    t.integer "val_type"
    t.decimal "val_num", precision: 8, scale: 2
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hospital_channel_id"
  end

  create_table "hospitals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name"
    t.string "loc_lng"
    t.string "loc_lat"
    t.string "address"
    t.string "opening_hours"
    t.string "tel"
    t.boolean "authorized"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "valid_status"
    t.string "company_name"
    t.string "wc_cover_img_url"
    t.string "wc_qrcode_ticket"
    t.string "wc_url"
    t.boolean "rewardable", default: false
    t.integer "hospital_area"
    t.integer "turnover_per_year"
    t.string "agreement_file"
    t.string "business_licence_file"
    t.string "business_licence_no"
    t.string "medical_license_file"
    t.datetime "medical_license_valid_from"
    t.datetime "medical_license_valid_to"
    t.string "bank_account_license"
    t.boolean "aptitude_complete"
    t.integer "hongbao_id"
    t.integer "hongbao_state"
    t.datetime "hongbao_auto_open_time"
    t.datetime "hongbao_auto_close_time"
    t.integer "owner_id"
    t.datetime "online_at"
    t.datetime "offline_at"
    t.string "legal_person_name"
    t.string "legal_person_idcard"
    t.string "legal_person_mobile"
    t.integer "jiufu_fuyou_account_status"
    t.string "jiufu_fuyou_account_last_errcode"
    t.string "jiufu_fuyou_account_last_errmsg"
    t.integer "district_id"
    t.integer "province_id"
    t.integer "city_id"
    t.integer "area_id"
    t.integer "edit_mask"
    t.integer "company_info_status"
    t.integer "company_punishment"
    t.integer "company_litigation"
    t.boolean "company_has_negative_info"
    t.string "company_negative_info"
    t.integer "legal_negative_info"
    t.integer "number_of_doctors"
    t.integer "hospital_size"
    t.integer "last_static_score"
    t.string "last_static_score_str"
    t.integer "last_dynamic_score"
    t.string "last_dynamic_score_str"
    t.integer "operator_id"
    t.string "lease_agreement_photo"
    t.string "org_code_photo"
    t.string "tax_reg_cert_photo"
    t.string "hospital_front_photo"
    t.string "hospital_env_photo"
    t.integer "hospital_rent_per_month"
    t.float "passed_rate", limit: 24
    t.boolean "whether_three_certificates_join_one"
    t.string "business_license_number"
    t.string "organization_code"
    t.string "tax_registration_code"
    t.boolean "the_third_party_whether_three_certificates_join_one"
    t.string "the_third_party_unified_social_code"
    t.string "the_third_party_business_license_number"
    t.string "the_third_party_organization_code"
    t.string "the_third_party_tax_registration_code"
  end

  create_table "images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "entity"
    t.integer "admin_id"
    t.datetime "deleted_at"
    t.integer "width"
    t.integer "height"
    t.integer "size"
    t.string "image_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "installment_action_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "installment_id"
    t.integer "dingdang", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "installment_contracts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "installment_id"
    t.string "contract_type"
    t.string "type_name"
    t.string "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "fileid"
    t.string "file"
  end

  create_table "installment_extend_infos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "installment_id"
    t.integer "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "expand_status"
    t.integer "expand_period"
    t.integer "credit_score"
    t.string "credit_score_str"
    t.decimal "c1_amount", precision: 10
    t.decimal "apply_expand_amount", precision: 10
    t.decimal "zhima_additional_amount", precision: 10
    t.string "zhima_score_str"
    t.decimal "credit_card_additional_amount", precision: 10
    t.string "credit_card_score_str"
    t.integer "final_score"
    t.string "final_score_str"
    t.decimal "final_max_amount", precision: 10
    t.integer "credit_card_score"
    t.integer "zhima_score"
    t.decimal "jiufu_principal_amount", precision: 10, scale: 2
    t.string "lng"
    t.string "lat"
    t.text "quota_json"
    t.decimal "channel_service_amount", precision: 6, scale: 2
    t.string "channel_openid"
    t.integer "multiple"
    t.decimal "private_withdraw_fee_ratio", precision: 6, scale: 5, default: "0.0"
    t.integer "operator_id"
    t.boolean "force_bad_debt"
    t.boolean "security_deposit_settle_completed"
    t.boolean "used_guarantee"
    t.integer "privilege_card_id"
    t.index ["installment_id"], name: "index_installment_extend_infos_on_installment_id"
  end

  create_table "installment_financial_product_items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "installment_id"
    t.integer "financial_product_item_id"
    t.integer "financial_product_id"
    t.integer "total_period"
    t.decimal "month_interest_percent", precision: 6, scale: 4, default: "0.0"
    t.decimal "month_service_fee_percent", precision: 6, scale: 4, default: "0.0"
    t.decimal "mch_subsidy_percent", precision: 6, scale: 4, default: "0.0"
    t.decimal "bill_month_interest_percent", precision: 10, scale: 8, default: "0.0"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "jiufu_code"
    t.index ["installment_id"], name: "index_installment_financial_product_items_on_installment_id", unique: true
  end

  create_table "installment_loans", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text "sended_options"
    t.datetime "successed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "installments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "product_name"
    t.decimal "total_amount", precision: 30, scale: 2
    t.integer "period_number"
    t.integer "hospital_no"
    t.string "plan_photo"
    t.string "scence_photo"
    t.string "consultant"
    t.integer "installment_status"
    t.decimal "month_amount", precision: 10, scale: 2
    t.decimal "down_payment", precision: 10, scale: 2
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "approved_amount", precision: 10, scale: 2
    t.integer "approved_period_number"
    t.decimal "approved_downpayment", precision: 10, scale: 2
    t.integer "downpayment_status"
    t.integer "selected_period_plan_id"
    t.string "loan_identity"
    t.decimal "remain_amount", precision: 10, scale: 2
    t.string "failed_reason"
    t.decimal "ahead_repaid_amount", precision: 8, scale: 2
    t.integer "ahead_repaid_period_number"
    t.decimal "ahead_repaid_saving_amount", precision: 10, scale: 2
    t.datetime "ahead_repaid_day"
    t.string "sign_id"
    t.integer "loan_status"
    t.datetime "loan_hospital_time"
    t.datetime "loan_ymj_time"
    t.string "note"
    t.datetime "sign_time"
    t.string "loan_confirm_pic"
    t.integer "loan_type"
    t.integer "repay_type"
    t.datetime "protocol_sign_time"
    t.datetime "first_repay_time"
    t.integer "paying_status"
    t.decimal "balance_amount", precision: 8, scale: 2
    t.string "contract_no"
    t.integer "protocol_version"
    t.string "after_loan_note"
    t.decimal "service_fee", precision: 8, scale: 2, default: "0.0"
    t.decimal "interest_ratio", precision: 8, scale: 5, default: "0.01"
    t.string "business_manager"
    t.string "contact_no"
    t.integer "overdue_count", default: 0
    t.integer "max_age", default: 0
    t.integer "sms_count", default: 0
    t.integer "installment_source"
    t.integer "after_loan_status"
    t.string "session_id"
    t.decimal "adjust_amount", precision: 8, scale: 2, default: "0.0"
    t.string "delegation_sign_id"
    t.string "jiufu_protocol_id"
    t.string "jiufu_sign_id"
    t.integer "history_status"
    t.integer "loan_source"
    t.string "hand_card_pic"
    t.boolean "is_high_risk_user"
    t.integer "channel_id"
    t.integer "hospital_channel_id"
    t.index ["hospital_no"], name: "idx_installments_hospital_no"
    t.index ["user_id"], name: "index_installments_on_user_id"
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "resume_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jd_async_backups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "version"
    t.string "merchant"
    t.string "tradeNum"
    t.string "code"
    t.string "desc"
    t.string "sign"
    t.string "tradeType"
    t.decimal "amount", precision: 10
    t.string "status"
    t.integer "payType"
    t.string "currency"
    t.string "tradeTime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "trade_amount", precision: 10
    t.string "device"
    t.string "otradenum"
    t.string "note"
    t.integer "trading_id"
  end

  create_table "jiu_fu_oss_attachments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "installment_id"
    t.string "attach_name"
    t.string "attach_type"
    t.string "file_id"
    t.string "file_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jiufu_bills", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "bill_id"
    t.boolean "is_reported", default: false
    t.boolean "interest_transfered", default: false
    t.integer "repayment_id"
    t.integer "stage"
    t.date "plan_repay_date"
    t.decimal "plan_repay_amount", precision: 10, scale: 2
    t.decimal "principal", precision: 10, scale: 2
    t.decimal "interest", precision: 10, scale: 2
    t.decimal "risk_amount", precision: 10, scale: 2
    t.decimal "punish_amount", precision: 10, scale: 2
    t.decimal "overdue_fee", precision: 10, scale: 2
    t.decimal "violate_amount", precision: 10, scale: 2
    t.decimal "petty_cash_fee", precision: 10, scale: 2
    t.decimal "service_fee", precision: 10, scale: 2
    t.decimal "repay_off_amount", precision: 10, scale: 2
    t.date "repay_date"
    t.string "repay_type"
    t.string "repay_status"
    t.string "report_uuid"
    t.datetime "synced_at"
    t.boolean "reporting", default: false
    t.decimal "ymj_subsidy_amount", precision: 10, scale: 2, default: "0.0"
  end

  create_table "jiufu_fuyou_account_errcodes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "err_code"
    t.string "err_str1"
    t.string "err_str2"
  end

  create_table "jiufu_money_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "type"
    t.integer "installment_id"
    t.integer "bill_id"
    t.integer "status", default: 1
    t.text "params"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "response_params"
  end

  create_table "jiufu_third_repay_results", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "app_id"
    t.integer "repay_stage"
    t.date "repay_plan_date"
    t.date "repay_real_date"
    t.decimal "repay_amount", precision: 8, scale: 2
    t.string "repay_status"
    t.string "repay_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "installment_id"
  end

  create_table "jiufu_trading_results", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.datetime "created_at", null: false
    t.string "mer_no"
    t.string "mer_order_no"
    t.string "plat_flow_no"
    t.string "create_time"
    t.string "complete_time"
    t.string "return_code"
    t.string "return_msg"
    t.string "sign"
    t.integer "status"
    t.decimal "order_amt", precision: 10, scale: 3
    t.integer "trading_id"
  end

  create_table "messages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.string "title"
    t.text "content", limit: 4294967295
    t.integer "message_type"
    t.datetime "expires_at"
    t.boolean "unread"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "push_content"
    t.datetime "pushed_at"
  end

  create_table "mobile_histories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.string "old_number"
    t.string "new_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "msg_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "mobile_number"
    t.text "msg_content"
    t.string "result"
    t.string "ctuid"
    t.string "callback_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "execute_begin_time"
    t.datetime "execute_end_time"
    t.string "banks"
    t.string "pages"
    t.string "context"
    t.string "type"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "open_attachments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "open_merchant_id"
    t.string "file_type"
    t.string "file_name"
    t.string "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_loans", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "open_merchant_id"
    t.string "transaction_no"
    t.text "options"
    t.integer "installment_id"
    t.text "err_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["installment_id"], name: "index_open_loans_on_installment_id"
    t.index ["open_merchant_id", "transaction_no"], name: "index_open_loans_on_open_merchant_id_and_transaction_no", unique: true
  end

  create_table "open_merchants", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "appid"
    t.string "name"
    t.string "encrypted_password"
    t.text "client_public_key"
    t.text "client_private_key"
    t.text "ymj_public_key"
    t.text "ymj_private_key"
    t.string "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "is_active", default: true
    t.integer "channel_id"
    t.index ["appid"], name: "index_open_merchants_on_appid", unique: true
  end

  create_table "open_push_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "type"
    t.integer "status", default: 1
    t.text "params_hash"
    t.text "push_params"
    t.integer "retry_times", default: 0
    t.datetime "pushed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "channel_id"
  end

  create_table "open_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.integer "open_merchant_id"
    t.string "login_token"
    t.boolean "verified", default: false
    t.datetime "verified_at"
    t.string "mobile_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "valid_time"
    t.index ["open_merchant_id"], name: "index_open_users_on_open_merchant_id"
    t.index ["user_id"], name: "index_open_users_on_user_id"
  end

  create_table "operator_switches", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "jxl_flag"
    t.boolean "mojie_flag"
    t.string "data_flow"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operator_verifies", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "credit_id"
    t.integer "review_id"
    t.integer "mobile_status"
    t.string "mobile_service"
    t.string "token"
    t.string "operator_type"
    t.string "type"
    t.boolean "skip", default: false
    t.datetime "mobile_verified_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.integer "coupon_id"
    t.decimal "product_price", precision: 10, scale: 2
    t.integer "pay_type"
    t.decimal "pay_amount", precision: 8, scale: 2
    t.integer "order_status"
    t.datetime "valid_time"
    t.integer "pay_channel"
    t.string "reservation_code"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "refund_reason_id"
    t.string "mobile_number"
    t.datetime "refunded_at"
    t.datetime "apply_refund_at"
  end

  create_table "pay_channels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "identity"
    t.decimal "rate", precision: 6, scale: 5
    t.integer "sort"
    t.boolean "viewable"
    t.boolean "refund_viewable"
    t.string "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "period_plans", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "installment_id"
    t.integer "period_number"
    t.decimal "period_amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permission_menus", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "controller_name"
    t.string "action_name"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_root_menu"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.integer "children_count"
    t.string "desc"
    t.string "menu_group"
  end

  create_table "permissions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "action_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "controller_name"
    t.string "name"
    t.integer "permission_menu_id"
  end

  create_table "permissions_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "permission_id", null: false
    t.integer "role_id", null: false
  end

  create_table "phone_messages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "info_string"
    t.text "phone_string", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind", default: 0
    t.integer "template_id"
    t.integer "bill_id"
    t.integer "parent_id"
    t.integer "admin_id"
    t.integer "channel_id"
    t.index ["bill_id"], name: "index_phone_messages_on_bill_id"
  end

  create_table "pictures", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "product_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "popular_recommendations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "icon"
    t.string "name"
    t.string "subtitle"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "privilege_card_template_hospital_channels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "privilege_card_template_id"
    t.integer "hospital_id"
    t.integer "hospital_channel_id"
    t.boolean "is_remove", default: false
    t.datetime "remove_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "privilege_card_template_issue_histories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "hospital_id"
    t.integer "privilege_card_template_id"
    t.integer "hospital_channel_id"
    t.integer "issue_method", limit: 2
    t.integer "issue_number"
    t.datetime "issue_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "privilege_card_templates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "function", limit: 2
    t.integer "increase_credit_limit_to"
    t.boolean "is_skip_auto_reject", default: false
    t.integer "effective_days"
    t.boolean "is_auto_issue", default: false
    t.integer "auto_issue_number"
    t.boolean "is_saas_open", default: false
    t.boolean "is_forbidden", default: false
    t.integer "available_number"
    t.integer "disable_number"
    t.integer "used_number"
    t.integer "overdue_number"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "privilege_card_use_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "privilege_card_id"
    t.integer "installment_id"
    t.datetime "charge_time"
    t.integer "status", limit: 2
    t.string "fail_reason"
    t.integer "before_charge_amount"
    t.integer "after_charge_amount"
    t.integer "saas_userable_id"
    t.string "saas_userable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hospital_id"
    t.integer "channel_id"
    t.integer "privilege_card_template_id"
    t.integer "before_charge_installment_status"
  end

  create_table "privilege_card_user_relations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "retransmission_user_type"
    t.integer "retransmission_user_id"
    t.string "qr_code_img_url"
    t.text "encrypted_character"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "privilege_card_id"
  end

  create_table "privilege_cards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "privilege_card_template_id"
    t.integer "privilege_card_template_issue_history_id"
    t.string "code"
    t.integer "status", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hospital_channel_id"
    t.datetime "overdue_time"
    t.index ["code"], name: "index_privilege_cards_on_code", unique: true
  end

  create_table "product_cats", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "product_id"
    t.integer "category_id"
    t.boolean "showed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_informations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "product_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "title"
    t.integer "city_id"
    t.string "summary"
    t.string "h5_url"
    t.decimal "price", precision: 10, scale: 2
    t.decimal "original_price", precision: 10, scale: 2
    t.decimal "downpayment", precision: 10, scale: 2
    t.integer "ordered_num"
    t.string "buy_notes"
    t.integer "hospital_id"
    t.integer "doctor_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "marketing_tag_type"
    t.string "marketing_tag_upper"
    t.string "marketing_tag_lower"
    t.decimal "period_amount", precision: 10, scale: 2
    t.integer "period_number"
    t.string "icon"
    t.datetime "valid_time"
    t.integer "limit_num"
    t.decimal "normal_price", precision: 8, scale: 2
    t.integer "product_status"
    t.boolean "is_anytime_refund"
    t.boolean "is_pay_first"
    t.boolean "is_installment"
    t.integer "sort"
    t.boolean "home_showed"
    t.boolean "is_free_booking"
    t.text "product_detail", limit: 4294967295
    t.string "product_time_length"
    t.string "product_pain_index"
    t.string "product_anesthesia_method"
    t.string "product_treatment_time"
    t.string "product_recovery_process"
    t.string "product_effective_time"
    t.string "product_stable_time"
    t.string "product_scar_status"
    t.string "product_effects_maintain"
    t.string "fit_people"
    t.string "fit_people_pic"
    t.string "case_comparison_pic"
    t.string "service_pic"
    t.integer "valid_status"
  end

  create_table "pushes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "token"
    t.integer "user_id"
    t.string "os"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "title"
    t.string "answer"
    t.string "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "redeem_codes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "code"
    t.integer "user_id"
    t.integer "redeem_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "redeem_project_id"
  end

  create_table "reedem_projects", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "amount"
    t.datetime "start_time"
    t.datetime "valid_time"
    t.integer "count"
    t.string "prefix"
    t.string "cover_url"
    t.integer "redeem_type"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "exchange_valid"
    t.string "channel"
  end

  create_table "refund_reasons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refunds", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "installment_id"
    t.datetime "apply_time"
    t.datetime "confirm_time"
    t.datetime "repay_time"
    t.decimal "fine_amount", precision: 10, scale: 2
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "refund_status"
    t.integer "source", default: 0
    t.text "refund_reason"
    t.string "refund_receipt_image_b"
    t.integer "business_refund_status"
    t.string "refund_receipt_image_c"
    t.integer "free_days"
    t.integer "buffer_days"
    t.float "buffer_money_ratio", limit: 24
    t.integer "can_refund_days"
    t.boolean "is_third_repayed"
  end

  create_table "regions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "region_id"
    t.string "name"
    t.integer "rank"
    t.string "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resumes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "mobile_number"
    t.string "birthday"
    t.string "college"
    t.text "introduction"
    t.string "resume_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cv_images"
    t.string "email"
  end

  create_table "review_attachments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "review_id"
    t.integer "attachment_type"
    t.integer "attachment_status"
    t.string "attachment_url"
    t.string "attachment_content"
    t.string "attachment_name"
    t.string "attachment_hint"
    t.integer "review_supplement_id"
    t.integer "supplement_type"
    t.datetime "created_at", default: "2017-06-05 04:21:14"
    t.index ["review_supplement_id"], name: "index_review_attachments_on_review_supplement_id"
  end

  create_table "review_ccs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "review_id"
    t.text "zhongsheng_person", limit: 4294967295
    t.text "zhongsheng_bank", limit: 4294967295
    t.text "jxl_comm_list", limit: 4294967295
    t.text "jxl_person", limit: 4294967295
    t.text "jxl_mobile", limit: 4294967295
    t.text "qianhai", limit: 4294967295
    t.text "huifa", limit: 4294967295
    t.text "tongdun", limit: 4294967295
    t.text "suanhua_litigation_detail", limit: 4294967295
    t.text "suanhua_litigation_summary", limit: 4294967295
    t.text "suanhua_bank_behavior", limit: 4294967295
    t.text "suanhua_bank_information", limit: 4294967295
    t.text "suanhua_person", limit: 4294967295
    t.text "suanhua_mobile", limit: 4294967295
    t.text "pengyuan_student_information", limit: 4294967295
    t.text "qianhai_blacklist"
    t.text "qianhai_address"
    t.text "qianhai_trusty"
    t.text "zhima_anti_fraud"
    t.text "pengyuan_tel"
    t.text "pengyuan_card", limit: 16777215
    t.text "pengyuan_income"
    t.text "tongdun_school"
    t.text "zs_mobile_duration"
    t.text "zs_mobile_status"
    t.text "zs_mobile_realname"
    t.text "pengyuan_phone"
    t.text "tongdun_risk"
    t.text "youdun_phone"
    t.text "qianhai_intimacy"
    t.integer "zhima_score"
    t.text "tongdun_rule"
    t.text "jiufu_black"
    t.text "rong360_comm_list", limit: 16777215
    t.text "shanyin_identity"
    t.text "yinlian_zhihui"
    t.text "shanyin_picture"
    t.text "zhengxin91"
    t.text "ji_ao"
    t.text "ji_ao_time"
    t.text "ji_ao_status"
    t.text "jxl_data"
    t.text "ucloud_file_name"
    t.text "rong360_data"
  end

  create_table "review_supplements", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "review_id"
    t.integer "status", default: 1
    t.integer "supplement_type"
    t.integer "batch", default: 1
    t.datetime "remind_time"
    t.string "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["review_id"], name: "index_review_supplements_on_review_id"
  end

  create_table "reviews", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.string "mobile_number"
    t.string "name"
    t.string "idcard_front"
    t.string "idcard_back"
    t.string "idcard_number"
    t.string "mail"
    t.string "address"
    t.integer "is_working"
    t.integer "educational_degree"
    t.string "university_name"
    t.integer "enrollment_year"
    t.integer "occupation"
    t.integer "position"
    t.string "company_name"
    t.string "company_telephone"
    t.string "card_owner"
    t.string "card_number"
    t.integer "card_bank"
    t.string "deposit_bank"
    t.string "card_mobile"
    t.string "contact_name"
    t.string "contact_mobile"
    t.string "district_id"
    t.string "company_address"
    t.string "company_district_id"
    t.integer "house_type"
    t.string "college"
    t.string "major"
    t.boolean "full_time"
    t.integer "graduation_year"
    t.integer "studying_time"
    t.string "student_id"
    t.string "mobile_service"
    t.integer "mobile_status"
    t.integer "contact_relation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "credit_id"
    t.integer "card_protocol_id"
    t.integer "installment_id"
    t.integer "review_status"
    t.string "call_1_number"
    t.string "call_2_number"
    t.string "call_3_number"
    t.string "call_4_number"
    t.string "call_1_content"
    t.string "call_2_content"
    t.string "call_3_content"
    t.string "call_4_content"
    t.string "deny_reason"
    t.integer "approve_code"
    t.integer "deny_code"
    t.boolean "agree_protocal"
    t.integer "marital_status"
    t.string "company_contact_name"
    t.string "company_contact_phone"
    t.string "university_district_id"
    t.string "company_contact_name2"
    t.string "company_contact_phone2"
    t.datetime "review_pre_time"
    t.datetime "review_attachments_remind_time"
    t.integer "review_attachments_status"
    t.text "cc_report", limit: 4294967295
    t.datetime "reviewed_time"
    t.string "qianhai_blacklist"
    t.string "qianhai_address"
    t.string "qianhai_trusty"
    t.string "wechat_id"
    t.string "credit_card"
    t.string "saving_card"
    t.string "card_mobile2"
    t.string "idcard_composite"
    t.integer "fake_tongdun_score"
    t.boolean "skiped_auto_reject", default: false
    t.index ["credit_id"], name: "index_reviews_on_credit_id"
  end

  create_table "risk_data", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text "shanyin_identity"
    t.text "rong_zhice"
    t.text "shanyin_pic"
    t.text "zhengxin91"
    t.text "ji_ao"
    t.text "ji_ao_time"
    t.text "ji_ao_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "review_id"
    t.text "jiufu_black"
    t.integer "credit_id"
    t.text "rong360_comm_list", limit: 4294967295
    t.text "py_card_auth"
    t.integer "zhima_score"
    t.text "ju_he"
    t.text "auth_info"
    t.text "card_number"
    t.text "error_info"
    t.text "error_card"
    t.text "jxl_comm_list", limit: 4294967295
    t.text "huadao_loan_info"
    t.text "huadao_black_info"
    t.text "tongdun_antifraud", limit: 4294967295
    t.string "tongdun_id"
  end

  create_table "roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name"
    t.integer "resource_id"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "description"
    t.boolean "sensitive_info_switch"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "saas_consultant_hospitals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "saas_consultant_id"
    t.integer "hospital_id"
    t.integer "valid_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "associate_time"
  end

  create_table "saas_consultants", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "wx_nickname"
    t.string "mobile"
    t.integer "gender", limit: 2
    t.string "city"
    t.string "avatar_url"
    t.integer "valid_status", limit: 2
    t.datetime "binding_mobile_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "openid"
    t.string "province"
  end

  create_table "saas_message_contents", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.string "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "saas_message_id"
  end

  create_table "saas_messages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "sender_id"
    t.string "sender_type"
    t.integer "receiver_id"
    t.string "receiver_type"
    t.boolean "unread", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "type"
    t.integer "sys_msg_type"
    t.datetime "deleted_at"
    t.string "title"
  end

  create_table "saas_permissions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "ancestry"
    t.string "code"
    t.string "controller_name"
    t.string "action_name"
    t.integer "ancestry_depth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saas_resource_assignments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "saas_user_id"
    t.integer "saas_resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saas_resources", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "instance_id"
    t.string "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "parent_id"
  end

  create_table "saas_user_hospitals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "saas_user_id"
    t.integer "hospital_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saas_user_permissions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "saas_user_id"
    t.integer "saas_permission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saas_user_roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "role_name"
    t.string "resource_type_provide"
    t.string "role_key"
  end

  create_table "saas_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "mobile"
    t.string "encrypted_password"
    t.datetime "last_sign_in_at"
    t.integer "position"
    t.integer "authority_type"
    t.integer "status", default: 0
    t.integer "admin_id"
    t.datetime "last_modified_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "role_id"
    t.string "role_key"
  end

  create_table "saler_day_report_hospitals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "admin_id"
    t.integer "hospital_id"
    t.string "department_name"
    t.string "rate"
    t.decimal "all_amount", precision: 10
    t.decimal "day_amount", precision: 10
    t.integer "apply"
    t.date "report_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "apply_passed"
    t.string "report_type"
    t.decimal "pass_rate", precision: 8, scale: 2, default: "0.0"
    t.decimal "m1", precision: 8, scale: 2, default: "0.0"
    t.decimal "m2", precision: 8, scale: 2, default: "0.0"
    t.decimal "m3_and_more", precision: 8, scale: 2, default: "0.0"
    t.integer "department_id"
    t.integer "parent_id"
    t.integer "operater_id"
    t.integer "hospital_channel_id"
  end

  create_table "saler_day_reports", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "admin_id"
    t.integer "ranking"
    t.integer "group_ranking"
    t.decimal "approve_amount", precision: 10, default: "0"
    t.integer "apply_count"
    t.decimal "pass_rate", precision: 6, scale: 4, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "report_date"
    t.string "department_name"
    t.string "report_type"
    t.integer "apply_passed", default: 0
    t.integer "department_id"
    t.integer "parent_id"
    t.integer "role"
  end

  create_table "security_deposit_bad_debt_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "security_deposit_bad_debt_id"
    t.integer "installment_id"
    t.decimal "bad_amount", precision: 12, scale: 2
    t.decimal "gearantee_amount", precision: 12, scale: 2
    t.integer "detail_type"
    t.integer "status"
    t.datetime "processed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["detail_type", "installment_id"], name: "idx_sdbdd_on_detail_type_and_installment_id"
    t.index ["installment_id"], name: "index_security_deposit_bad_debt_details_on_installment_id"
    t.index ["security_deposit_bad_debt_id"], name: "idx_sd_bad_debt_details_on_sd_bad_debt_id"
  end

  create_table "security_deposit_bad_debts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "hospital_channel_id"
    t.decimal "bad_amount", precision: 16, scale: 2, default: "0.0"
    t.decimal "deducted_amount", precision: 16, scale: 2, default: "0.0"
    t.decimal "pending_deduct_amount", precision: 16, scale: 2, default: "0.0"
    t.integer "installments_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["hospital_channel_id"], name: "index_security_deposit_bad_debts_on_hospital_channel_id"
  end

  create_table "security_deposit_configs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "security_depositable_id"
    t.string "security_depositable_type"
    t.string "type"
    t.integer "money_type"
    t.decimal "security_deposit_ratio", precision: 6, scale: 5, default: "0.0"
    t.integer "unfreeze_type"
    t.text "unfreeze_rules"
    t.decimal "guarantee_percent", precision: 7, scale: 4
    t.decimal "single_limit_money", precision: 10, scale: 4
    t.decimal "month_limit_money", precision: 12, scale: 4
    t.string "limit_period_numbers"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "guarantee_type"
    t.integer "bad_debt_determine_days"
    t.boolean "stop_guarantee_when_settlement_completed", default: false
    t.decimal "settle_fee_percent", precision: 5, scale: 2, default: "0.0"
    t.index ["security_depositable_type", "security_depositable_id"], name: "idx_security_deposit_configs_on_sdtype_and_sdid"
  end

  create_table "security_deposit_pool_flows", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "security_deposit_pool_id"
    t.decimal "amount", precision: 11, scale: 2
    t.decimal "pool_amount", precision: 16, scale: 2
    t.decimal "pool_usable_amount", precision: 16, scale: 2
    t.integer "flow_type"
    t.integer "installment_id"
    t.string "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "type"
    t.index ["security_deposit_pool_id"], name: "index_security_deposit_pool_flows_on_security_deposit_pool_id"
  end

  create_table "security_deposit_pools", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "hospital_channel_id"
    t.decimal "total_amount", precision: 16, scale: 2, default: "0.0"
    t.decimal "usable_amount", precision: 16, scale: 2, default: "0.0"
    t.decimal "freeze_amount", precision: 16, scale: 2, default: "0.0"
    t.decimal "settled_amount", precision: 16, scale: 2, default: "0.0"
    t.decimal "bad_debt_used_amount", precision: 16, scale: 2, default: "0.0"
    t.decimal "refund_back_amount", precision: 16, scale: 2, default: "0.0"
    t.decimal "pending_deduct_amount", precision: 16, scale: 2, default: "0.0"
    t.decimal "manual_recharge_amount", precision: 16, scale: 2, default: "0.0"
    t.decimal "guarantee_up_limit", precision: 16, scale: 2, default: "0.0"
    t.integer "installments_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["hospital_channel_id"], name: "index_security_deposit_pools_on_hospital_channel_id", unique: true
  end

  create_table "security_deposit_settlement_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "installment_id"
    t.float "unfreeze_percent", limit: 24
    t.decimal "unfreeze_amount", precision: 8, scale: 2
    t.datetime "expect_freeze_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "status", default: 0
    t.datetime "processed_at"
    t.index ["installment_id"], name: "idx_settlement_details_on_settlement_id_and_installment_id"
  end

  create_table "security_deposit_settlements", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "settlementable_id"
    t.string "settlementable_type"
    t.integer "parent_id"
    t.decimal "total_amount", precision: 12, scale: 2
    t.integer "status", default: 0
    t.datetime "processed_at"
    t.string "invoice_file"
    t.string "settlement_file"
    t.string "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_time"
    t.integer "level"
    t.text "extend_info"
    t.decimal "withdraw_fee", precision: 8, scale: 2, default: "0.0"
    t.index ["end_time"], name: "index_security_deposit_settlements_on_end_time"
    t.index ["parent_id"], name: "index_security_deposit_settlements_on_parent_id"
    t.index ["settlementable_type", "settlementable_id"], name: "idx_security_deposit_settlements_on_stype_and_sid"
  end

  create_table "shan_xin_trading_results", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "merc_id"
    t.string "request_id"
    t.string "interface_name"
    t.string "version"
    t.string "sign_type"
    t.string "hmac"
    t.string "order_id"
    t.string "amount"
    t.string "fee"
    t.string "pay_status"
    t.string "pay_day"
    t.string "pay_time"
    t.string "rmk"
    t.string "pay_result_msg"
    t.string "pay_result_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trading_id"
  end

  create_table "short_messages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "mobile_number"
    t.string "code"
    t.datetime "valid_time"
    t.boolean "verification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "short_urls", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "long_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sms_templates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "title"
    t.string "content"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "purpose"
    t.index ["purpose"], name: "index_sms_templates_on_purpose", unique: true
  end

  create_table "success_trading_infos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "success_trading_id"
    t.string "user_name"
    t.decimal "should_pay_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "pay_capital", precision: 10, scale: 2, default: "0.0"
    t.decimal "interest_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "service_fee_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "overdue_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "balance_amount", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "success_tradings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "trading_id"
    t.integer "bill_id"
    t.integer "installment_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trading_type"
    t.integer "user_id"
    t.string "note"
    t.integer "repayed_channel"
  end

  create_table "sys_configs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "c_key"
    t.text "c_value", limit: 4294967295
    t.integer "pid"
    t.string "c_name"
    t.string "c_type"
    t.string "c_url"
  end

  create_table "third_party_data", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "idcard_number"
    t.integer "mobile_number"
    t.string "zhima_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zhima_open_id"
    t.string "return_url"
    t.string "mj_task_no"
    t.string "mj_return_url"
    t.string "transaction_no"
  end

  create_table "third_party_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "log_type"
    t.string "status"
    t.text "fail_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tongdun_monitors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "installment_id"
    t.integer "monitor_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tongdun_id"
    t.date "begin_scan_time"
    t.date "end_scan_time"
    t.text "fail_reason"
    t.text "risk_info", limit: 4294967295
    t.date "next_scan_time"
  end

  create_table "trading_results", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "transtype"
    t.string "cporderid"
    t.string "transid"
    t.string "appuserid"
    t.string "appid"
    t.integer "waresid"
    t.integer "feetype"
    t.decimal "money", precision: 10, scale: 2
    t.string "currency"
    t.integer "result"
    t.string "transtime"
    t.string "cpprivate"
    t.integer "paytype"
    t.string "sign"
    t.string "signtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tradings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.decimal "money", precision: 10, scale: 2
    t.string "cporderid"
    t.integer "trading_type"
    t.integer "relate_id"
    t.integer "trading_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "relate_ids"
    t.integer "pay_channel_type"
    t.integer "pay_channel_id"
    t.decimal "fee_rate", precision: 6, scale: 5, default: "0.0"
    t.decimal "fee", precision: 8, scale: 2, default: "0.0"
    t.integer "withhold_type"
  end

  create_table "transfer_payments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.decimal "amount", precision: 10, scale: 2
    t.integer "account_no"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "province_code"
    t.string "city_code"
    t.integer "sort"
  end

  create_table "update_versions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "newest_android_version"
    t.string "newest_ios_version"
    t.boolean "ios_force_update"
    t.boolean "android_force_update"
    t.string "summary"
    t.string "os"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "newest_windows_saas_version"
  end

  create_table "uploads", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "type"
    t.string "image"
    t.integer "resource_id"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["resource_id", "resource_type"], name: "index_uploads_on_resource_id_and_resource_type"
    t.index ["type"], name: "index_uploads_on_type"
  end

  create_table "user_activities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "admin_id"
    t.string "controller_name"
    t.string "action_name"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_tokens", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "user_id"
    t.string "os"
    t.string "device_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "uid"
    t.string "mobile_number"
    t.string "nickname"
    t.string "password_digest"
    t.integer "password_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "consignee_id"
    t.integer "gender"
    t.integer "inviter_id"
    t.string "avatar_url"
    t.integer "wrong_input"
    t.boolean "has_new_messages"
    t.integer "repay_day"
    t.string "wechat_openid"
    t.integer "user_type"
    t.integer "sms_count", default: 0
    t.string "primary_mobile"
    t.string "zhima_openid"
    t.boolean "is_active"
    t.datetime "credit_auth_time"
    t.integer "privilege_card_frequency"
    t.datetime "privilege_card_input_time"
  end

  create_table "weixin_auto_replies", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "key_word"
    t.text "content"
    t.string "type"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weixin_images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "installment_id"
    t.integer "image_type"
    t.integer "image_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "credit_id"
    t.string "media_id"
    t.integer "reviewattachment_id"
  end

  create_table "wexin_public_accounts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "weixin_secret_key"
    t.string "weixin_token"
    t.index ["weixin_secret_key"], name: "index_wexin_public_accounts_on_weixin_secret_key"
    t.index ["weixin_token"], name: "index_wexin_public_accounts_on_weixin_token"
  end

  create_table "white_lists", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "phone"
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wx_backups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "appid"
    t.string "mch_id"
    t.string "nonce_str"
    t.string "sign"
    t.string "result_code"
    t.string "openid"
    t.string "trade_type"
    t.string "bank_type"
    t.integer "total_fee"
    t.integer "cash_fee"
    t.string "transaction_id"
    t.string "out_trade_no"
    t.string "time_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "return_code"
    t.integer "trading_id"
  end

  add_foreign_key "async_processors", "users"
  add_foreign_key "hospital_personal_accounts", "hospitals"
  add_foreign_key "open_loans", "installments"
  add_foreign_key "open_users", "open_merchants"
  add_foreign_key "open_users", "users"
end
