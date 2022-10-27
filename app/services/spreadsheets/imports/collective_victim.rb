# frozen_string_literal: true

module Spreadsheets
  module Imports
    class CollectiveVictim < ActiveInteraction::Base
      string :case_detail_id
      hash :case_data, strip: false

      def execute
        create_collective_victim
      end

      private

      def create_collective_victim
        collective_victim = Victims::CollectiveVictim.create!(
          case_detail_id:      case_detail_id,
          affected_total:      case_data["Number of affected people"].gsub(",", ""),
          refer_to_individuals: refer_to_individuals?(case_data["Does the number of affected people refer to individuals"]),
          male_total:          case_data["Write the number of male from the total number of individuals affected:"].to_s.gsub(
            ",", ""
          ).to_f,
          female_total:        case_data["Write the number of female from the total number of individuals affected:"].to_s.gsub(
            ",", ""
          ).to_f,
        )

        create_age_bracket_breakdowns(collective_victim)
      end

      def create_age_bracket_breakdowns(collective_victim)
        if zero_to_fourteen_age_bracket_breakdown > 0
          collective_victim.age_bracket_breakdowns.create!(age_bracket: AgeBracket.find_by(name: "A"),
            total: zero_to_fourteen_age_bracket_breakdown)
        end

        if sixty_and_above_age_bracket_breakdown > 0
          collective_victim.age_bracket_breakdowns.create!(age_bracket: AgeBracket.find_by(name: "D"),
            total: sixty_and_above_age_bracket_breakdown)
        end
      end

      def refer_to_individuals?(value)
        return true if value.to_s.downcase == "yes"

        false
      end

      def zero_to_fourteen_age_bracket_breakdown
        case_data["Write the number of 0-14 years old from the total number of individuals affected:"].to_s.gsub(",",
          "").to_f
      end

      def sixty_and_above_age_bracket_breakdown
        case_data["Write the number of 0-14 years old from the total number of individuals affected:"].to_s.gsub(",",
          "").to_f
      end
    end
  end
end
