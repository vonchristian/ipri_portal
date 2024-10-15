# frozen_string_literal: true

module CaseDetails
  class Index < ActiveInteraction::Base
    object :documenter, class: Users::Documenter

    string :search, :incident_start_year, :tag, default: nil
    uuid :country_id, default: nil

    def execute
      @case_details = case_details.text_search(search) if search.present?
      @case_details = case_details.where(country_id: country_id) if country_id.present?
      @case_details = case_details.where(incident_start_year: incident_start_year) if incident_start_year.present?
      @case_details = case_details.tagged_with(tag) if tag.present?

      case_details.order(submission_date_year: :desc, submission_date_month: :desc, submission_date_day: :desc)
    end

    private

    def case_details
      @case_details ||= if documenter.country_partner?
        documenter.case_details
      elsif documenter.ipri_employee?
        ::CaseDetails::CaseDetail.all
      end
    end
  end
end
