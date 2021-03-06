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
      :user_id

    validates :first_name, :last_name, :organization_name, :email,
      :submission_date_month, :submission_date_day, :submission_date_year, :primary_data,
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
        documenter_id:         user_id
      )

      if documents.present?
        case_detail.documents.attach(documents)
      end
    end
  end
end
