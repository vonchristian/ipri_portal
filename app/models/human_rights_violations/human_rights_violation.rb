# frozen_string_literal: true

module HumanRightsViolations
  class HumanRightsViolation < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    has_many :categorizations, class_name: "HumanRightsViolations::Categorization", dependent: :destroy
    has_many :categories, through: :categorizations
    has_many :perpetratorizations, class_name: "HumanRightsViolations::Perpetratorization", dependent: :destroy
    has_many :perpetrator_categories,
      through: :perpetratorizations,
      class_name: "HumanRightsViolations::PerpetratorCategory"
    accepts_nested_attributes_for :categorizations, allow_destroy: true
    accepts_nested_attributes_for :perpetratorizations, allow_destroy: true

    def self.submitted_current_year
      joins(:case_detail).where("case_details.submission_date_year" => Date.current.year)
    end
  end
end
