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

ActiveRecord::Schema[7.2].define(version: 2024_10_24_043812) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accuser_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_accuser_categories_on_title", unique: true
  end

  create_table "actions_undertakens", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "case_detail_id", null: false
    t.string "advocacy_or_action"
    t.text "advocacy_or_action_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advocacy_or_action"], name: "index_actions_undertakens_on_advocacy_or_action"
    t.index ["case_detail_id"], name: "index_actions_undertakens_on_case_detail_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "age_brackets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "min_age"
    t.integer "max_age"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "case_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "organization_name", null: false
    t.integer "submission_date_year", null: false
    t.integer "submission_date_day", null: false
    t.string "submission_date_month", null: false
    t.integer "incident_start_year"
    t.integer "incident_start_day"
    t.string "incident_start_month"
    t.integer "incident_end_year"
    t.integer "incident_end_day"
    t.string "incident_end_month"
    t.integer "incident_hour"
    t.integer "incident_minute"
    t.string "time_period"
    t.string "reference_number", null: false
    t.boolean "primary_data", default: false, null: false
    t.string "data_sharing"
    t.uuid "country_id"
    t.string "subnational_location"
    t.string "location_details_1"
    t.string "location_details_2"
    t.text "data_sources"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "documenter_id"
    t.text "impact_to_victim_details"
    t.text "impact_to_community_details"
    t.text "actions_taken_details"
    t.boolean "actions_taken_status"
    t.string "documenter_first_name"
    t.string "documenter_last_name"
    t.string "documenter_email"
    t.string "documenter_phone_number"
    t.string "documenter_organization"
    t.integer "killings_count"
    t.integer "individual_victims_count"
    t.integer "collective_victims_count"
    t.integer "criminalizations_count"
    t.integer "human_rights_violations_count"
    t.integer "development_projects_count"
    t.index ["actions_taken_status"], name: "index_case_details_on_actions_taken_status"
    t.index ["collective_victims_count"], name: "index_case_details_on_collective_victims_count"
    t.index ["country_id"], name: "index_case_details_on_country_id"
    t.index ["criminalizations_count"], name: "index_case_details_on_criminalizations_count"
    t.index ["data_sharing"], name: "index_case_details_on_data_sharing"
    t.index ["development_projects_count"], name: "index_case_details_on_development_projects_count"
    t.index ["documenter_id"], name: "index_case_details_on_documenter_id"
    t.index ["human_rights_violations_count"], name: "index_case_details_on_human_rights_violations_count"
    t.index ["individual_victims_count"], name: "index_case_details_on_individual_victims_count"
    t.index ["killings_count"], name: "index_case_details_on_killings_count"
    t.index ["reference_number"], name: "index_case_details_on_reference_number", unique: true
  end

  create_table "case_imports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "spreadsheet_file_name"
    t.string "spreadsheet_content_type"
    t.bigint "spreadsheet_file_size"
    t.datetime "spreadsheet_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "case_projects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "case_detail_id", null: false
    t.uuid "development_project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_detail_id"], name: "index_case_projects_on_case_detail_id"
    t.index ["development_project_id"], name: "index_case_projects_on_development_project_id"
  end

  create_table "collective_victim_age_bracket_breakdowns", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "collective_victim_id", null: false
    t.uuid "age_bracket_id", null: false
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_bracket_id"], name: "index_collective_victim_breakdowns_on_age_bracket_id"
    t.index ["collective_victim_id"], name: "index_collective_victim_breakdowns_on_collective_victim_id"
  end

  create_table "collective_victims", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "case_detail_id", null: false
    t.text "affected_total"
    t.text "victim_details"
    t.boolean "refer_to_individuals"
    t.integer "male_total"
    t.integer "female_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_detail_id"], name: "index_collective_victims_on_case_detail_id"
  end

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "country_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "information_source"
    t.index ["country_id"], name: "index_companies_on_country_id"
  end

  create_table "company_projects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id", null: false
    t.uuid "development_project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_projects_on_company_id"
    t.index ["development_project_id"], name: "index_company_projects_on_development_project_id"
  end

  create_table "countries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.integer "case_details_count", default: 0, null: false
    t.integer "killings_count", default: 0, null: false
    t.integer "criminalizations_count", default: 0, null: false
    t.integer "human_rights_violations_count", default: 0, null: false
    t.boolean "priority", default: false
    t.index ["case_details_count"], name: "index_countries_on_case_details_count"
    t.index ["priority"], name: "index_countries_on_priority"
  end

  create_table "criminalization_accuserizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "criminalization_id", null: false
    t.uuid "accuser_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accuser_category_id"], name: "index_criminalization_accuserizations_on_accuser_category_id"
    t.index ["criminalization_id"], name: "index_criminalization_accuserizations_on_criminalization_id"
  end

  create_table "criminalizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "case_detail_id"
    t.text "criminalization_details"
    t.string "experienced_harrassment_or_intimidation"
    t.text "harrassment_or_intimidation_details"
    t.text "accusation_or_charges_details"
    t.text "policies_or_laws_used"
    t.text "accuser_details"
    t.string "case_filing_status"
    t.string "case_filing_details"
    t.string "case_decision_status"
    t.string "case_decision_details"
    t.string "victims_in_detention"
    t.text "victims_in_detention_details"
    t.string "case_filing_against_perpetrator"
    t.text "case_filing_against_perpetrator_details"
    t.string "state_action_to_address_criminalization"
    t.text "state_action_to_address_criminalization_details"
    t.string "investigation_on_criminalization"
    t.text "investigation_on_criminalization_details"
    t.text "impact_to_victim_details"
    t.text "impact_to_community_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_decision_status"], name: "index_criminalizations_on_case_decision_status"
    t.index ["case_detail_id"], name: "index_criminalizations_on_case_detail_id"
    t.index ["case_filing_against_perpetrator"], name: "index_criminalizations_on_case_filing_against_perpetrator"
    t.index ["case_filing_status"], name: "index_criminalizations_on_case_filing_status"
    t.index ["experienced_harrassment_or_intimidation"], name: "index_criminalizations_on_harrassment_or_intimidation"
    t.index ["investigation_on_criminalization"], name: "index_criminalizations_on_investigation_on_criminalization"
    t.index ["state_action_to_address_criminalization"], name: "index_criminalizations_on_state_action_to_address"
    t.index ["victims_in_detention"], name: "index_criminalizations_on_victims_in_detention"
  end

  create_table "development_project_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "development_project_categorizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "project_id", null: false
    t.uuid "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_development_project_categorizations_on_category_id"
    t.index ["project_id", "category_id"], name: "index_project_and_category_in_project_categorizations", unique: true
    t.index ["project_id"], name: "index_development_project_categorizations_on_project_id"
  end

  create_table "development_projects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "project_start_year"
    t.text "website_sources"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "parent_company_country_id"
    t.string "parent_company_name"
    t.text "parent_company_description"
    t.string "parent_company_data_sources"
    t.text "funding_source_description"
    t.text "funding_source_data_sources"
    t.index ["parent_company_country_id"], name: "index_development_projects_on_parent_company_country_id"
  end

  create_table "documenters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number"
    t.uuid "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale"
    t.string "role"
    t.index ["country_id"], name: "index_documenters_on_country_id"
    t.index ["email"], name: "index_documenters_on_email", unique: true
    t.index ["role"], name: "index_documenters_on_role"
  end

  create_table "funding_sources", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "human_rights_violation_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_human_rights_violation_categories_on_title", unique: true
  end

  create_table "human_rights_violation_categorizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "human_rights_violation_id", null: false
    t.uuid "human_rights_violation_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["human_rights_violation_category_id", "human_rights_violation_id"], name: "index_hrv_categorizations_on_hrv_category_id_and_hrv_id", unique: true
    t.index ["human_rights_violation_category_id"], name: "index_hr_violation_categorizations_on_hr_violation_category_id"
    t.index ["human_rights_violation_id"], name: "index_hr_violation_categorizations_on_hr_violation_id"
  end

  create_table "human_rights_violation_perpetrator_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_human_rights_violation_perpetrator_categories_on_title", unique: true
  end

  create_table "human_rights_violation_perpetratorizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "human_rights_violation_id", null: false
    t.uuid "perpetrator_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["human_rights_violation_id"], name: "index_hr_violation_perpetrators_on_hr_violation_id"
    t.index ["perpetrator_category_id"], name: "index_hr_violation_perpetrators_on_perpetrator_category_id"
  end

  create_table "human_rights_violations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "case_detail_id", null: false
    t.text "violation_details"
    t.string "alleged_perpetrators_known"
    t.text "alleged_perpetrator_details"
    t.string "case_filing_status"
    t.text "case_filing_details"
    t.string "state_action_to_address_violation"
    t.string "state_action_to_address_violation_details"
    t.string "investigation_on_violation"
    t.text "investigation_on_violation_details"
    t.string "impact_to_victim_details"
    t.text "impact_to_community_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alleged_perpetrators_known"], name: "index_human_rights_violations_on_alleged_perpetrators_known"
    t.index ["case_detail_id"], name: "index_human_rights_violations_on_case_detail_id"
    t.index ["case_filing_status"], name: "index_human_rights_violations_on_case_filing_status"
    t.index ["investigation_on_violation"], name: "index_human_rights_violations_on_investigation_on_violation"
    t.index ["state_action_to_address_violation"], name: "index_hr_violations_on_state_action_to_address_violation"
  end

  create_table "individual_victim_case_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "victim_id", null: false
    t.uuid "case_detail_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_detail_id"], name: "index_individual_victim_case_details_on_case_detail_id"
    t.index ["victim_id"], name: "index_victim_on_individual_victim_details"
  end

  create_table "individual_victims", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "age_bracket_id", null: false
    t.string "full_name"
    t.string "gender"
    t.string "dependent_type"
    t.string "ethnic_identity"
    t.string "date_of_birth_month"
    t.integer "date_of_birth_day"
    t.integer "date_of_birth_year"
    t.text "victim_role"
    t.text "dependent_details"
    t.uuid "case_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_bracket_id"], name: "index_individual_victims_on_age_bracket_id"
    t.index ["case_detail_id"], name: "index_individual_victims_on_case_detail_id"
    t.index ["dependent_type"], name: "index_individual_victims_on_dependent_type"
    t.index ["gender"], name: "index_individual_victims_on_gender"
  end

  create_table "killing_perpetrator_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_killing_perpetrator_categories_on_title", unique: true
  end

  create_table "killing_perpetratorizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "killing_id", null: false
    t.uuid "perpetrator_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["killing_id"], name: "index_killing_perpetratorizations_on_killing_id"
    t.index ["perpetrator_category_id"], name: "index_killing_perpetratorizations_on_perpetrator_category_id"
  end

  create_table "killings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "case_detail_id", null: false
    t.text "killing_details"
    t.text "killing_carried_out"
    t.string "experienced_harrassment_or_intimidation"
    t.text "harrassment_or_intimidation_details"
    t.string "alleged_perpetrators_known"
    t.text "alleged_perpetrator_details"
    t.string "case_filing_status"
    t.text "case_filing_details"
    t.string "state_action_to_address_killing"
    t.text "state_action_to_address_killing_details"
    t.string "investigation_on_killing"
    t.text "investigation_on_killing_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alleged_perpetrators_known"], name: "index_killings_on_alleged_perpetrators_known"
    t.index ["case_detail_id"], name: "index_killings_on_case_detail_id"
    t.index ["case_filing_status"], name: "index_killings_on_case_filing_status"
    t.index ["experienced_harrassment_or_intimidation"], name: "index_killings_on_experienced_harrassment_or_intimidation"
    t.index ["investigation_on_killing"], name: "index_killings_on_investigation_on_killing"
    t.index ["state_action_to_address_killing"], name: "index_killings_on_state_action_to_address_killing"
  end

  create_table "project_fundings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "funding_source_id", null: false
    t.uuid "development_project_id", null: false
    t.text "funding_description"
    t.text "website_sources"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["development_project_id"], name: "index_project_fundings_on_development_project_id"
    t.index ["funding_source_id"], name: "index_project_fundings_on_funding_source_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.uuid "taggable_id"
    t.string "tagger_type"
    t.uuid "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  add_foreign_key "actions_undertakens", "case_details"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "case_details", "countries"
  add_foreign_key "case_details", "documenters"
  add_foreign_key "case_projects", "case_details"
  add_foreign_key "case_projects", "development_projects"
  add_foreign_key "collective_victim_age_bracket_breakdowns", "age_brackets"
  add_foreign_key "collective_victim_age_bracket_breakdowns", "collective_victims"
  add_foreign_key "collective_victims", "case_details"
  add_foreign_key "companies", "countries"
  add_foreign_key "company_projects", "companies"
  add_foreign_key "company_projects", "development_projects"
  add_foreign_key "criminalization_accuserizations", "accuser_categories"
  add_foreign_key "criminalization_accuserizations", "criminalizations"
  add_foreign_key "criminalizations", "case_details"
  add_foreign_key "development_project_categorizations", "development_project_categories", column: "category_id"
  add_foreign_key "development_project_categorizations", "development_projects", column: "project_id"
  add_foreign_key "documenters", "countries"
  add_foreign_key "human_rights_violation_categorizations", "human_rights_violation_categories"
  add_foreign_key "human_rights_violation_categorizations", "human_rights_violations"
  add_foreign_key "human_rights_violation_perpetratorizations", "human_rights_violation_perpetrator_categories", column: "perpetrator_category_id"
  add_foreign_key "human_rights_violation_perpetratorizations", "human_rights_violations"
  add_foreign_key "human_rights_violations", "case_details"
  add_foreign_key "individual_victim_case_details", "case_details"
  add_foreign_key "individual_victim_case_details", "individual_victims", column: "victim_id"
  add_foreign_key "individual_victims", "age_brackets"
  add_foreign_key "individual_victims", "case_details"
  add_foreign_key "killing_perpetratorizations", "killing_perpetrator_categories", column: "perpetrator_category_id"
  add_foreign_key "killing_perpetratorizations", "killings"
  add_foreign_key "killings", "case_details"
  add_foreign_key "project_fundings", "development_projects"
  add_foreign_key "project_fundings", "funding_sources"
  add_foreign_key "taggings", "tags"
end
