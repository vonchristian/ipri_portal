module FactSheets
  class Documenter
    include ActiveModel::Model

    attr_accessor :first_name, :last_name, :documenter_organization, :reference_number, :primary_data,
    :phone_number, :document_file_upload, :website_links, :submission_date_month, :submission_date_day, :submission_date_year, :check_email, :check_phone_number,
    :email, :phone_number, :documenter_email, :documenter_phone_number, :primary_data

    validates :first_name, :last_name, :documenter_organization, :reference_number, :submission_date_month, :submission_date_day, :submission_date_year, presence: true

    def process!
      ApplicationRecord.transaction do
        create_fact_sheet
      end
    end

    private

    def create_fact_sheet
      FactSheet.create!(
        documenter_first_name:        first_name,
        documenter_last_name:         last_name,
        documenter_organization_name: documenter_organization,
        submission_date_year:         submission_date_year,
        submission_date_day:          submission_date_day,
        submission_date_month:        submission_date_month,
        primary_data:                 primary_data,
        reference_number:             reference_number,
        documenter_email:             documenter_email,
        documenter_phone_number:      documenter_phone_number,
        incident_start_year:          submission_date_year,
        incident_start_day:           submission_date_day,
        incident_start_month:         submission_date_month,
      )
    end
  end
end
