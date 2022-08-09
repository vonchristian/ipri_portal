# frozen_string_literal: true

module HumanRightsViolations
  class HumanRightsViolation < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    has_many :categorizations, class_name: "HumanRightsViolations::Categorization"
    has_many :categories, through: :categorizations

    def self.submitted_current_year
      joins(:case_detail).where('case_details.submission_date_year' => Date.current.year)
    end
  end
end
