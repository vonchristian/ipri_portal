module FactSheets
  module Victims
    class Individual
      include ActiveModel::Model

      attr_accessor :fact_sheet_id, :gender, :full_name, :dependent_type, :ethnic_identity, :victim_role, :dependent_details,
      :age_bracket_id, :date_of_birth_day, :date_of_birth_month, :date_of_birth_year

      def process!
        ApplicationRecord.transaction do
          create_individual_victim
        end
      end

      private

      def create_individual_victim
        IndividualVictim.create!(
          fact_sheet_id:       fact_sheet_id,
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
      end
    end
  end
end
