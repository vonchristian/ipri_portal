# frozen_string_literal: true

module CaseDetails
  class Documenter
    include ActiveModel::Model

    attr_accessor :first_name,
      :last_name,
      :organization_name,
      :phone_number,
      :email,
      :reference_number,
      :primary_data,
      :website_links,
      :submission_date_month,
      :submission_date_day,
      :submission_date_year,
      :data_sources,
      :documents,
      :documenter_id,
      :locale

    validates :first_name,
      :last_name,
      :organization_name,
      :email,
      :submission_date_month,
      :submission_date_day,
      :submission_date_year,
      presence: true

    def process!
      if valid?
        ApplicationRecord.transaction do
          create_case_detail
        end
      end
    end

    private

    def create_case_detail
      case_detail = CaseDetails::CaseDetail.create!(
        submission_date_year:  submission_date_year,
        submission_date_day:   submission_date_day,
        submission_date_month: submission_date_month,
        primary_data:          primary_data,
        reference_number:      reference_number,
        incident_start_year:   submission_date_year,
        incident_start_day:    submission_date_day,
        incident_start_month:  submission_date_month,
        organization_name:     organization_name,
        data_sharing:          "restricted",
        documenter_id:         documenter_id,
        documenter_first_name: documenter_first_name,
        documenter_last_name: documenter.present? ? documenter.last_name : last_name,
        documenter_email: documenter.present? ? documenter.email : email,
        documenter_phone_number: documenter.present? ? documenter.phone_number : phone_number,
        documenter_organization: organization_name,
      )

      if documents.present?
        case_detail.documents.attach(documents)
      end
    end

    def documenter_first_name
      documenter.present? ? documenter.first_name : first_name
    end

    def documenter
      Users::Documenter.find_by(id: documenter_id)
    end
  end
end
