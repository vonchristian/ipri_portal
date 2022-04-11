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
      :submission_date_year

    validates :first_name, :last_name, :organization_name,
      :submission_date_month, :submission_date_day, :submission_date_year,
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
      CaseDetail.create!(
        submission_date_year:         submission_date_year,
        submission_date_day:          submission_date_day,
        submission_date_month:        submission_date_month,
        primary_data:                 primary_data,
        reference_number:             reference_number,
        incident_start_year:          submission_date_year,
        incident_start_day:           submission_date_day,
        incident_start_month:         submission_date_month,
        organization_name:            organization_name,
        data_sharing:                 false,
        documenter_id:                   find_or_create_user.id,
      )
    end

    def find_or_create_user
      user = User.find_by(email: email, first_name: first_name, last_name: last_name)
      return user if user

      User.create!(email: email, first_name: first_name, last_name: last_name, password: 'password123', password_confirmation: 'password123')
    end
  end
end
