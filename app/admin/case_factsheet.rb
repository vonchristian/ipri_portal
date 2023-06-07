# frozen_string_literal: true

ActiveAdmin.register(CaseDetails::CaseDetail, as: "Case Factsheets") do
  permit_params :organization_name,
    :country_id,
    :submission_date_year,
    :submission_date_day,
    :submission_date_month,
    :incident_start_year,
    :incident_start_day,
    :incident_start_month,
    :incident_end_year,
    :incident_end_day,
    :incident_end_month,
    :incident_hour,
    :incident_minute,
    :time_period,
    :reference_number,
    :primary_data,
    :data_sharing,
    :subnational_location,
    :location_details_1,
    :location_details_2,
    :data_sources,
    :created_at,
    :updated_at,
    :documenter_id,
    :impact_to_victim_details,
    :impact_to_community_details,
    :actions_taken_details,
    :actions_taken_status,
    :documenter_first_name,
    :documenter_last_name,
    :documenter_email,
    :documenter_phone_number,
    :documenter_organization,
    :tag_list
  index do
    selectable_column
    id_column
    column :organization_name
    column :country
  end

  form do |f|
    f.inputs do
      f.input(:tag_list, as: :tags, collection: ActsAsTaggableOn::Tag.pluck(:name))
    end
    f.actions
  end
end
