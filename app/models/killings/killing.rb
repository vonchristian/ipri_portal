# frozen_string_literal: true

module Killings
  class Killing < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    has_many :perpetratorizations, class_name: "Killings::Perpetratorization", dependent: :destroy
    has_many :perpetrator_categories, through: :perpetratorizations

    accepts_nested_attributes_for :perpetratorizations, reject_if: :all_blank, allow_destroy: true

    counter_culture [:case_detail, :country]

    def self.submitted_current_year
      joins(:case_detail).where("case_details.submission_date_year" => Date.current.year)
    end

    def victim
      case_detail.individual_victims.first
    end

    def self.ransackable_attributes(auth_object = nil)
      ["alleged_perpetrator_details", "alleged_perpetrators_known", "case_detail_id", "case_filing_details", "case_filing_status", "created_at", "experienced_harrassment_or_intimidation", "harrassment_or_intimidation_details", "id", "id_value", "investigation_on_killing", "investigation_on_killing_details", "killing_carried_out", "killing_details", "state_action_to_address_killing", "state_action_to_address_killing_details", "updated_at"]
    end
  end
end
