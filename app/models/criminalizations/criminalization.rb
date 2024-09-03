# frozen_string_literal: true

module Criminalizations
  class Criminalization < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail", counter_cache: :criminalizations_count
    has_many :accuserizations, class_name: "Criminalizations::Accuserization", dependent: :destroy
    has_many :accuser_categories, class_name: "Criminalizations::AccuserCategory", through: :accuserizations
    accepts_nested_attributes_for :accuserizations, reject_if: :all_blank, allow_destroy: true

    BOOLEAN_STATUSES = {
      "yes" => "Yes",
      "no" => "No",
      "no_information" => "No Information"
    }

    def self.submitted_current_year
      joins(:case_detail).where("case_details.submission_date_year" => Date.current.year)
    end
  end
end
