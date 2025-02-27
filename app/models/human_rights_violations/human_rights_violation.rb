# frozen_string_literal: true

module HumanRightsViolations
  class HumanRightsViolation < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    has_many :categorizations, class_name: "HumanRightsViolations::Categorization", dependent: :destroy
    has_many :categories, through: :categorizations
    has_many :perpetratorizations, class_name: "HumanRightsViolations::Perpetratorization", dependent: :destroy
    has_many :perpetrator_categories,
      through: :perpetratorizations
    accepts_nested_attributes_for :categorizations, allow_destroy: true
    accepts_nested_attributes_for :perpetratorizations, allow_destroy: true

    counter_culture [:case_detail, :country]

    def self.submitted_current_year
      joins(:case_detail).where("case_details.submission_date_year" => Date.current.year)
    end

    def self.ransackable_attributes(auth_object = nil)
      ["alleged_perpetrator_details", "alleged_perpetrators_known", "case_detail_id", "case_filing_details", "case_filing_status", "created_at", "id", "id_value", "impact_to_community_details", "impact_to_victim_details", "investigation_on_violation", "investigation_on_violation_details", "state_action_to_address_violation", "state_action_to_address_violation_details", "updated_at", "violation_details"]
    end
  end
end
