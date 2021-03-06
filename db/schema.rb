# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_28_110741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_posts", id: :serial, force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.string "preview_description"
    t.text "body", null: false
    t.integer "category", default: 0, null: false
    t.integer "created_by_id", null: false
    t.boolean "published", default: false, null: false
    t.datetime "published_at"
    t.integer "view_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "index_image"
    t.index ["slug"], name: "index_blog_posts_on_slug"
  end

  create_table "check_ins", id: :serial, force: :cascade do |t|
    t.integer "shift_id"
    t.bigint "check_in_date_time"
    t.bigint "check_out_date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.integer "user_id"
    t.integer "check_in_date"
    t.datetime "check_in"
    t.datetime "check_out"
    t.index ["shift_id"], name: "index_check_ins_on_shift_id"
  end

  create_table "companies", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_customer_id"
    t.boolean "demo", default: false, null: false
    t.string "hash_key"
    t.string "size"
    t.integer "schedule_start_day", default: 1, null: false
    t.integer "pay_by_type", default: 0, null: false
    t.integer "onboarding_step", default: 0, null: false
  end

  create_table "company_inquiries", id: :serial, force: :cascade do |t|
    t.string "company_name"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "job_title", null: false
    t.integer "employee_count", default: 0, null: false
    t.integer "public_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", id: :serial, force: :cascade do |t|
    t.integer "company_id"
    t.integer "exp_month", null: false
    t.integer "exp_year", null: false
    t.integer "last_4", null: false
    t.string "brand", null: false
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default", default: false, null: false
    t.string "stripe_card_id"
    t.index ["company_id"], name: "index_credit_cards_on_company_id"
  end

  create_table "email_captures", id: :serial, force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_positions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "position_id"
    t.boolean "primary", default: false, null: false
    t.index ["position_id"], name: "index_employee_positions_on_position_id"
    t.index ["user_id"], name: "index_employee_positions_on_user_id"
  end

  create_table "favorite_shifts", id: :serial, force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "position_id", null: false
    t.integer "start_minute", null: false
    t.integer "end_minute", null: false
    t.integer "week_day", default: 30, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_favorite_shifts_on_location_id"
    t.index ["position_id"], name: "index_favorite_shifts_on_position_id"
  end

  create_table "features", id: :serial, force: :cascade do |t|
    t.string "key", null: false
    t.string "description"
  end

  create_table "firebase_tokens", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "token", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "token"], name: "index_firebase_tokens_on_user_id_and_token", unique: true
    t.index ["user_id"], name: "index_firebase_tokens_on_user_id"
  end

  create_table "impersonations", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "impersonated_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "in_progress_shifts", id: :serial, force: :cascade do |t|
    t.integer "company_id"
    t.integer "minute_start", null: false
    t.integer "minute_end", null: false
    t.integer "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.integer "user_id"
    t.integer "scheduling_period_id"
    t.boolean "edited", default: true, null: false
    t.integer "repeating_shift_id"
    t.boolean "published", default: false, null: false
    t.integer "state", default: 0, null: false
    t.datetime "deleted_at"
    t.integer "position_id"
    t.index ["company_id"], name: "index_in_progress_shifts_on_company_id"
    t.index ["location_id"], name: "index_in_progress_shifts_on_location_id"
    t.index ["repeating_shift_id"], name: "index_in_progress_shifts_on_repeating_shift_id"
    t.index ["scheduling_period_id"], name: "index_in_progress_shifts_on_scheduling_period_id"
    t.index ["user_id"], name: "index_in_progress_shifts_on_user_id"
  end

  create_table "incidents", id: :serial, force: :cascade do |t|
    t.integer "report_id"
    t.integer "rating", default: 0, null: false
    t.integer "likelihood"
    t.integer "score", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.date "occured_on"
    t.integer "category", default: 0, null: false
    t.string "summary"
    t.index ["report_id"], name: "index_incidents_on_report_id"
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "leads", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "preferred_contact", default: 0, null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_leads_on_user_id"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.string "line_1"
    t.string "line_2"
    t.string "line_3"
    t.string "city"
    t.string "county_province"
    t.string "postalcode"
    t.string "country", default: "US", null: false
    t.string "additional_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id", null: false
    t.string "name"
    t.string "time_zone", default: "Eastern Time (US & Canada)", null: false
    t.boolean "use_custom_scheduling_rules", default: false, null: false
    t.string "hash_key"
    t.index ["company_id"], name: "index_locations_on_company_id"
  end

  create_table "login_users", id: :serial, force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.integer "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_login_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_login_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_login_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_login_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_login_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_login_users_on_reset_password_token", unique: true
  end

  create_table "manage_positions", id: :serial, force: :cascade do |t|
    t.integer "position_id"
    t.integer "manages_id", null: false
    t.index ["position_id"], name: "index_manage_positions_on_position_id"
  end

  create_table "notification_preferences", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.boolean "global_unsubscribe", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notification_preferences_on_user_id"
  end

  create_table "oauth_access_grants", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.integer "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "offers", id: :serial, force: :cascade do |t|
    t.integer "company_id"
    t.integer "trade_id"
    t.string "note"
    t.integer "offered_shift_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "state", default: 0, null: false
    t.datetime "accepted_or_declined_at"
    t.integer "approved_by"
    t.index ["company_id"], name: "index_offers_on_company_id"
    t.index ["trade_id"], name: "index_offers_on_trade_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "plan_features", id: :serial, force: :cascade do |t|
    t.integer "plan_id"
    t.integer "feature_id"
    t.index ["feature_id"], name: "index_plan_features_on_feature_id"
    t.index ["plan_id"], name: "index_plan_features_on_plan_id"
  end

  create_table "plans", id: :serial, force: :cascade do |t|
    t.string "plan_name"
    t.boolean "default", default: false
    t.integer "price", default: 0, null: false
  end

  create_table "popular_times", id: :serial, force: :cascade do |t|
    t.integer "day_start"
    t.integer "day_end"
    t.integer "time_start"
    t.integer "time_end"
    t.string "holiday_name"
    t.integer "level", null: false
    t.string "type", null: false
    t.string "popular_type", null: false
    t.integer "popular_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", id: :serial, force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "name", null: false
    t.boolean "company_admin", default: false, null: false
    t.boolean "location_admin", default: false, null: false
    t.datetime "deleted_at"
    t.integer "base_pay", default: 0
    t.index ["company_id"], name: "index_positions_on_company_id"
  end

  create_table "postings", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "location_id", null: false
    t.integer "date_start", null: false
    t.integer "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "all_shifts", default: true, null: false
    t.index ["location_id"], name: "index_postings_on_location_id"
    t.index ["user_id"], name: "index_postings_on_user_id"
  end

  create_table "preferences", id: :serial, force: :cascade do |t|
    t.integer "preferable_id", null: false
    t.integer "shift_overlap", default: 15, null: false
    t.integer "minimum_shift_length", default: 240, null: false
    t.integer "maximum_shift_length", default: 480, null: false
    t.integer "break_length", default: 60, null: false
    t.string "preferable_type", default: "Company", null: false
    t.boolean "use_company_settings", default: true, null: false
    t.boolean "paid_break", default: false, null: false
    t.integer "minimum_hours_for_break", default: 4, null: false
    t.integer "preferred_shift_length", default: 360, null: false
    t.boolean "approve_trades", default: true, null: false
    t.index ["preferable_id"], name: "index_preferences_on_preferable_id"
  end

  create_table "preferred_hours", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "day"
    t.integer "start", default: 0, null: false
    t.integer "end", default: 1440, null: false
    t.index ["user_id", "day"], name: "index_preferred_hours_on_user_id_and_day", unique: true
    t.index ["user_id"], name: "index_preferred_hours_on_user_id"
  end

  create_table "public_companies", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "website"
    t.string "company_type"
    t.string "headquarters"
    t.integer "founded"
    t.string "linkedin_url"
    t.string "twitter_url"
    t.string "facebook_url"
    t.string "instagram_url"
    t.string "youtube_url"
    t.string "gd_logo_url"
    t.string "gd_url"
    t.integer "gd_employer_id"
    t.integer "gd_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid", null: false
    t.integer "category", default: 0, null: false
    t.integer "company_size", default: 0, null: false
    t.integer "revenue", default: 0, null: false
    t.index ["name"], name: "index_public_companies_on_name"
    t.index ["uuid"], name: "index_public_companies_on_uuid"
  end

  create_table "public_reports", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "role", default: 0, null: false
    t.date "incident_date"
    t.string "accused"
    t.boolean "still_happening"
    t.string "committed_by"
    t.text "what_happened", null: false
    t.boolean "did_you_respond", default: false, null: false
    t.boolean "notified_others", default: false, null: false
    t.integer "reported_to", default: 0, null: false
    t.boolean "experienced_retaliation", default: false, null: false
    t.boolean "job_affected", default: false, null: false
    t.text "job_affected_description"
    t.text "others_present"
    t.boolean "others_affected", default: false, null: false
    t.boolean "sought_treatment", default: false, null: false
    t.text "handled_description"
    t.boolean "handled_satisfied", default: false, null: false
    t.text "preferred_handling"
    t.text "summary"
    t.boolean "discussed"
    t.string "uuid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category", default: 0, null: false
    t.string "company_name"
    t.integer "public_company_id"
    t.integer "gender", default: 0, null: false
    t.integer "race", default: 0, null: false
    t.string "ip_address"
    t.string "remote_ip_address"
    t.string "user_agent"
  end

  create_table "repeating_shifts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "position_id"
    t.integer "start_date", null: false
    t.integer "repeat_frequency", default: 7, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id", null: false
    t.boolean "published", default: false, null: false
    t.integer "minute_start", null: false
    t.integer "minute_end", null: false
    t.integer "in_progress_shift_id"
    t.integer "preview_user_id"
    t.integer "preview_position_id"
    t.integer "preview_start_date"
    t.integer "preview_repeat_frequency"
    t.integer "preview_location_id"
    t.integer "preview_minute_end"
    t.integer "preview_minute_start"
    t.datetime "deleted_at"
    t.datetime "preview_deleted_at"
    t.index ["location_id"], name: "index_repeating_shifts_on_location_id"
    t.index ["position_id"], name: "index_repeating_shifts_on_position_id"
    t.index ["user_id"], name: "index_repeating_shifts_on_user_id"
  end

  create_table "report_details", id: :serial, force: :cascade do |t|
    t.integer "report_id"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_report_details_on_report_id"
  end

  create_table "reports", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "started_at"
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "finished_review", default: false, null: false
    t.datetime "finished_review_at"
    t.boolean "started_review", default: false, null: false
    t.datetime "started_review_at"
    t.integer "reviewed_by"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "schedule_rules", id: :serial, force: :cascade do |t|
    t.integer "ruleable_id", null: false
    t.integer "position_id", null: false
    t.integer "period", default: 2, null: false
    t.integer "number_of_employees", default: 1, null: false
    t.string "ruleable_type", default: "Company", null: false
    t.integer "day"
    t.index ["position_id", "period", "day"], name: "index_schedule_rules_on_position_id_and_period_and_day", unique: true
    t.index ["position_id"], name: "index_schedule_rules_on_position_id"
    t.index ["ruleable_id"], name: "index_schedule_rules_on_ruleable_id"
    t.index ["ruleable_type", "ruleable_id"], name: "index_schedule_rules_on_ruleable_type_and_ruleable_id"
  end

  create_table "scheduled_task_runs", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.boolean "failed", null: false
    t.text "output"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scheduling_hours", id: :serial, force: :cascade do |t|
    t.integer "location_id"
    t.integer "day", null: false
    t.integer "minute_open_start", null: false
    t.integer "minute_open_end", null: false
    t.integer "minute_schedulable_start"
    t.integer "minute_schedulable_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "closed", default: false, null: false
    t.index ["location_id", "day"], name: "index_scheduling_hours_on_location_id_and_day", unique: true
    t.index ["location_id"], name: "index_scheduling_hours_on_location_id"
  end

  create_table "scheduling_periods", id: :serial, force: :cascade do |t|
    t.integer "company_id"
    t.integer "location_id"
    t.integer "start_date", null: false
    t.integer "end_date", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_scheduling_periods_on_company_id"
    t.index ["location_id"], name: "index_scheduling_periods_on_location_id"
  end

  create_table "shifts", id: :serial, force: :cascade do |t|
    t.integer "company_id"
    t.integer "minute_start", null: false
    t.integer "minute_end", null: false
    t.integer "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id", null: false
    t.integer "user_id", null: false
    t.integer "state", default: 0, null: false
    t.string "note"
    t.integer "position_id"
    t.integer "in_progress_shift_id"
    t.datetime "deleted_at"
    t.integer "repeating_shift_id"
    t.index ["company_id"], name: "index_shifts_on_company_id"
    t.index ["in_progress_shift_id"], name: "index_shifts_on_in_progress_shift_id"
    t.index ["location_id"], name: "index_shifts_on_location_id"
    t.index ["position_id"], name: "index_shifts_on_position_id"
    t.index ["user_id"], name: "index_shifts_on_user_id"
  end

  create_table "subscriptions", id: :serial, force: :cascade do |t|
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_subscription_id"
    t.integer "plan_id"
    t.index ["company_id"], name: "index_subscriptions_on_company_id"
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id"
  end

  create_table "time_off_requests", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "start_date"
    t.integer "start_minutes"
    t.integer "end_minutes"
    t.integer "end_date"
    t.integer "status", default: 0, null: false
    t.integer "reviewed_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_time_off_requests_on_user_id"
  end

  create_table "trades", id: :serial, force: :cascade do |t|
    t.integer "shift_id", null: false
    t.integer "location_id"
    t.string "note", null: false
    t.boolean "accept_offers", default: true, null: false
    t.integer "accepted_shift_id"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "traded_with_id"
    t.index ["location_id"], name: "index_trades_on_location_id"
    t.index ["shift_id"], name: "index_trades_on_shift_id"
    t.index ["user_id"], name: "index_trades_on_user_id"
  end

  create_table "user_locations", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "location_id", null: false
    t.boolean "home", default: false
    t.boolean "admin", default: false, null: false
    t.index ["location_id"], name: "index_user_locations_on_location_id"
    t.index ["user_id", "location_id"], name: "index_user_locations_on_user_id_and_location_id", unique: true
    t.index ["user_id"], name: "index_user_locations_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id", null: false
    t.string "mobile_phone"
    t.string "given_name"
    t.string "family_name"
    t.string "preferred_name"
    t.boolean "company_admin", default: false
    t.datetime "deleted_at"
    t.boolean "scheduleless_admin", default: false, null: false
    t.integer "primary_position_id"
    t.string "locale", default: "en", null: false
    t.string "hash_key"
    t.integer "wage_cents"
    t.boolean "salary", default: false, null: false
    t.integer "login_user_id"
    t.integer "date_of_birth"
    t.integer "work_phone"
    t.boolean "display_phone", default: true
    t.integer "legal_gender"
    t.integer "manager_id"
    t.integer "primary_location_id"
    t.integer "employee_status", default: 0, null: false
    t.integer "start_date"
    t.boolean "performs_exempt_duties", default: false, null: false
    t.integer "exemption_status", default: 0, null: false
    t.integer "salary_amount_cents"
    t.integer "employment_type", default: 0, null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["login_user_id"], name: "index_users_on_login_user_id"
  end

  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_grants", "users", column: "resource_owner_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "shifts", "locations"
  add_foreign_key "shifts", "users"
end
