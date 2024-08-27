# frozen_string_literal: true

module CaseDetails
  class Index < ActiveInteraction::Base
    object :documenter, class: Users::Documenter

    string :search, default: nil

    def execute
      @case_details = case_details.text_search(search) if search.present?

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
