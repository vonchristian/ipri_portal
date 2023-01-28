# frozen_string_literal: true

module CaseDetails
  module Victims
    class Individual
      include ActiveModel::Model

      attr_accessor :case_detail_id,
        :gender,
        :full_name,
        :dependent_type,
        :ethnic_identity,
        :victim_role,
        :dependent_details,
        :age_bracket_id,
        :date_of_birth_day,
        :date_of_birth_month,
        :date_of_birth_year

      validates :case_detail_id,
        :gender,
        :full_name,
        :dependent_type,
        :victim_role,
        :ethnic_identity,
        :dependent_details,
        :age_bracket_id,
        presence: true
      def process!
        ApplicationRecord.transaction do
          create_individual_victim
        end
      end

      private

      def create_individual_victim
        ::Victims::IndividualVictim.find_or_create_by(
          full_name:           full_name,
          gender:              gender,
          dependent_type:      dependent_type,
          ethnic_identity:     ethnic_identity,
          victim_role:         victim_role,
          dependent_details:   dependent_details,
          age_bracket_id:      age_bracket_id,
          date_of_birth_day:   date_of_birth_day,
          date_of_birth_month: date_of_birth_month,
          date_of_birth_year:  date_of_birth_year,
          case_detail_id: case_detail_id,
        )
      end
    end
  end
end
