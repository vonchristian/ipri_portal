# frozen_string_literal: true

module CaseDetails
  module Victims
    class Individual < ActiveInteraction::Base 
      object :case_detail, class: CaseDetails::CaseDetail

      string :gender, 
        :full_name,
        :dependent_type,
        :ethnic_identity,
        :victim_role,
        :dependent_details,
        :age_bracket_id,
        :date_of_birth_known,
        :date_of_birth_day,
        :date_of_birth_month,
        :date_of_birth_year, default: nil

      validates :gender,
        :full_name,
        :dependent_type,
        :victim_role,
        :ethnic_identity,
        :dependent_details,
        :age_bracket_id,
        presence: true

      def execute
        individual_victim = case_detail.individual_victims.create!(
          full_name:           full_name,
          gender:              gender,
          dependent_type:      dependent_type,
          ethnic_identity:     ethnic_identity,
          victim_role:         victim_role,
          dependent_details:   dependent_details,
          age_bracket_id:      age_bracket_id,
          date_of_birth_day:   date_of_birth_day,
          date_of_birth_month: date_of_birth_month,
          date_of_birth_year:  date_of_birth_year
        )

        individual_victim
      end
    end
  end
end
