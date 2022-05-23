# frozen_string_literal: true

module HumanRightsViolations
  class HumanRightsViolation < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    has_many :categorizations, class_name: "HumanRightsViolations::Categorization"
    has_many :categories, through: :categorizations
  end
end
