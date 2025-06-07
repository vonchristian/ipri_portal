# frozen_string_literal: true

ActiveAdmin.register(CaseDetails::CaseDetail, as: "Case Details") do
  belongs_to :country, optional: true

  actions :all, except: [:new]
  filter :country_id, as: :select, collection: Country.order(name: :asc).map { |country| [country.name, country.id] }
  filter :submission_date_year, as: :select, collection: 20.years.ago.year..Date.current.year, label: "Submission Year"
  filter :incident_start_year, as: :select, collection: 20.years.ago.year..Date.current.year, label: "Incident Year"
  filter :data_sharing, as: :select, collection: CaseDetails::CaseDetail.data_sharings.keys
  filter :documenter_id, as: :select, collection: Users::Documenter.all.map { |user| [user.full_name, user.id] }
  filter :individual_victims_full_name, as: :string, label: "Individual Victims Name"

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
    :incident_investigation_details,
    :actions_taken_status,
    :documenter_first_name,
    :documenter_last_name,
    :documenter_email,
    :documenter_phone_number,
    :documenter_organization,
    tag_list: []

  index do
    selectable_column
    id_column
    column :organization_name
    column :country
  end

  form do |f|
    panel "Documenter Details" do
      f.inputs do
        f.input(:documenter_first_name, label: "First Name")
        f.input(:documenter_last_name, label: "Last Name")
        f.input(:organization_name, label: "Organization/Affiliation")
        f.input(:documenter_email, label: "Email")
        f.input(:documenter_phone_number, label: "Phone Number")
        f.input(:willing_to_share_more_info, label: "Are you willing to share more information with IPRI?")
      end
    end

    panel "Case Details" do
      f.inputs do
        f.input(:primary_data)
        f.input(:submission_date_month, as: :select, collection: Date::MONTHNAMES)
        f.input(:submission_date_day, as: :select, collection: 1..(Date.current.all_month.count))
        f.input(:submission_date_year, as: :select, collection: (Date.current - 10.years).year..(Time.zone.now.year))
        f.input(:data_sources)
        f.input(:tag_list, as: :select, multiple: true, collection: ActsAsTaggableOn::Tag.pluck(:name))
      end
    end

    panel "Place and Date of Incident" do
      f.inputs do
        f.input(:country_id, as: :select, collection: Country.all.map { |country| [country.id, country.name] })
        f.input(:subnational_location)
        f.input(:location_details_1, label: "Other Location Details (1)")
        f.input(:location_details_2, label: "Other Location Details (2)")
        f.input(:incident_start_month, as: :select, collection: Date::MONTHNAMES)
        f.input(:incident_start_day, as: :select, collection: 1..(Date.current.all_month.count))
        f.input(:incident_start_year, as: :select, collection: (Date.current - 10.years).year..(Time.zone.now.year))
        f.input(:incident_end_month, as: :select, collection: Date::MONTHNAMES)
        f.input(:incident_end_day, as: :select, collection: 1..(Date.current.all_month.count))
        f.input(:incident_end_year, as: :select, collection: (Date.current - 10.years).year..(Time.zone.now.year))
      end
    end

    panel "Impact of Incident/s of Human Rights Violations" do
      f.inputs do
        f.input(:impact_to_victim_details, as: :text, label: "How did the incident/s affect the victim/s and his/her/their family?")
        f.input(:impact_to_community_details, as: :text, label: "How did the incident/s affect the Indigenous Peoples group/s or community/ies and/or organization of the victim/s?")
        f.input(:actions_taken_details, as: :text, label: "Is/Are there any other advocacy and/or action/s undertaken ?")
        f.input(:incident_investigation_details, as: :text, label: "Has there been any investigation/s on the incident of other type of human right violation ?")
      end
    end

    f.actions
  end

  show do |case_detail|
    panel "Documenter Details" do
      attributes_table do
        row :documenter_first_name
        row :documenter_last_name
        row :documenter_email
        row :documenter_phone_number
        row :documenter_organization
        row "Are you willing to share more information with IPRI?" do |case_detail|
          case_detail.willing_to_share_more_info
        end
      end
    end

    panel "Case Details" do
      attributes_table do
        row :primary_data
        row :submission_date
        row :ongoing_case
        row :data_sharing_content
        row :tags do |tag|
          tag.tag_list.join(", ") # Show tags
        end
      end
    end

    panel "Place and Date of Incident" do
      attributes_table do
        row :country do |case_detail|
          case_detail.country&.name || "No country assigned"
        end
        row "Subnational Location" do |case_detail|
          case_detail.subnational_location
        end

        row "Other Location Details (1)" do |case_detail|
          case_detail.location_details_1
        end

        row "Other Location Details (2)" do |case_detail|
          case_detail.location_details_2
        end

        row "Incident Start" do |case_detail|
          case_detail.incident_start_date
        end

        row "Incident End" do |case_detail|
          case_detail.incident_end_date
        end

        row "Ongoing Case?" do |case_detail|
          case_detail.ongoing_case
        end
      end
    end

    panel "Impact of Incident/s of Human Rights Violations" do
      attributes_table do
        row "How did the incident/s affect the victim/s and his/her/their family?" do |case_detail|
          case_detail.impact_to_victim_details
        end

        row "How did the incident/s affect the Indigenous Peoples group/s or community/ies and/or organization of the victim/s?" do |case_detail|
          case_detail.impact_to_community_details
        end

        row "Advocacies and/or action/s undertaken" do |case_detail|
          case_detail.actions_taken_details
        end
      end
    end

    panel "Criminalizations" do
      table_for case_detail.criminalizations do |criminalization|
        column :details do |object|
          link_to object.criminalization_details, admin_case_detail_criminalization_path(case_detail_id: object.case_detail_id, id: object.id)
        end
      end

      div do
        para do
          link_to "Add New", new_admin_case_detail_criminalization_path(resource), class: "button"
        end
      end
    end

    panel "Killings" do
      table_for case_detail.killings do |killing|
        column :details do |object|
          link_to object.killing_details, admin_case_detail_killing_path(case_detail_id: object.case_detail_id, id: object.id)
        end
      end

      div do
        para do
          link_to "Add New", new_admin_case_detail_killing_path(resource), class: "button"
        end
      end
    end

    panel "Other Human Rights Violations" do
      table_for case_detail.human_rights_violations do |human_rights_violation|
        column :details do |object|
          link_to object.violation_details, admin_case_detail_rights_violation_path(case_detail_id: object.case_detail_id, id: object.id)
        end
      end

      div do
        para do
          link_to "Add New", new_admin_case_detail_rights_violation_path(resource), class: "button"
        end
      end
    end

    panel "Individual Victims" do
      table_for case_detail.individual_victims do |individual_victim|
        column :full_name do |object|
          link_to object.full_name, admin_case_detail_individual_victim_path(case_detail_id: object.case_detail_id, id: object.id)
        end
      end

      div do
        para do
          link_to "Add New", new_admin_case_detail_individual_victim_path(resource), class: "button"
        end
      end
    end

    panel "Collective Victims" do
      table_for case_detail.collective_victims do |collective_victim|
        column :details do |object|
          link_to object.victim_details, admin_case_detail_collective_victim_path(case_detail_id: object.case_detail_id, id: object.id)
        end
      end
      div do
        para do
          link_to "Add New", new_admin_case_detail_collective_victim_path(resource), class: "button"
        end
      end
    end
  end
end
