# frozen_string_literal: true

module Criminalizations
  class Criminalization < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    has_many :accuserizations, class_name: "Criminalizations::Accuserization", dependent: :destroy
    has_many :accuser_categories, class_name: "Criminalizations::AccuserCategory", through: :accuserizations

    counter_culture [:case_detail, :country]


    BOOLEAN_STATUSES = {
      "yes" => "Yes",
      "no" => "No",
      "no_information" => "No Information"
    }

    def self.submitted_current_year
      joins(:case_detail).where("case_details.submission_date_year" => Date.current.year)
    end

    def self.ransackable_attributes(auth_object = nil)
      ["accusation_or_charges_details", "accuser_details", "case_decision_details", "case_decision_status", "case_detail_id", "case_filing_against_perpetrator", "case_filing_against_perpetrator_details", "case_filing_details", "case_filing_status", "created_at", "criminalization_details", "experienced_harrassment_or_intimidation", "harrassment_or_intimidation_details", "id", "id_value", "impact_to_community_details", "impact_to_victim_details", "investigation_on_criminalization", "investigation_on_criminalization_details", "policies_or_laws_used", "state_action_to_address_criminalization", "state_action_to_address_criminalization_details", "updated_at", "victims_in_detention", "victims_in_detention_details"]
    end
  end
end
