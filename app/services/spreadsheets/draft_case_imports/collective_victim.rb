# frozen_string_literal: true

module Spreadsheets
  module DraftCaseImports
    class CollectiveVictim < ActiveInteraction::Base
      object :draft_case_detail, class: "CaseDetails::DraftCaseDetail"
      hash :case_data, strip: false

      def execute
        draft_case_detail.update(
          affected_total:      case_data["Number of affected people"].to_s.gsub(",", ""),
          refer_to_individuals: case_data["Does the number of affected people refer to individuals"].to_s.downcase == "yes",
          male_total:          case_data["Write the number of male from the total number of individuals affected:"].to_s.gsub(
            ",", ""
          ).to_f,
          female_total:        case_data["Write the number of female from the total number of individuals affected:"].to_s.gsub(
            ",", ""
          ).to_f,
          age_bracket_breakdown_0_12: case_data["Write the number of 0-12 years old from the total number of individuals affected:"].to_s.gsub(
            ",",
            "",
          ).to_i,
          age_bracket_breakdown_13_25: case_data["Write the number of 13-25 years old from the total number of individuals affected:"].to_s.gsub(
            ",",
            "",
          ).to_i,
          age_bracket_breakdown_26_35: case_data["Write the number of 26-35 years old from the total number of individuals affected:"].to_s.gsub(
            ",",
            "",
          ).to_i,
          age_bracket_breakdown_36_59: case_data["Write the number of 36-59 years old from the total number of individuals affected:"].to_s.gsub(
            ",",
            "",
          ).to_i,
          age_bracket_breakdown_60_plus: case_data["Write the number of 60 and above years old from the total number of individuals affected:"].to_s.gsub(
            ",",
            "",
          ).to_i,
        )
      end
    end
  end
end
