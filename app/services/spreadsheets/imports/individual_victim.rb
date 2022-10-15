# frozen_string_literal: true

module Spreadsheets
  module Imports
    class IndividualVictim < ActiveInteraction::Base
      GENDER_TRANSLATIONS = {
        "M" => "male",
        "F" => "female",
        "Z" => "lgbtqia+",
      }
      DEPENDENT_TRANSLATIONS = {
        "WD" => "with_dependents",
        "WOD" => "without_dependents",
        "ND" => "no_data",
      }

      string :case_detail_id
      hash :case_data, strip: false

      def execute
        create_individual_victim
      end

      private

      def create_individual_victim
        Victims::IndividualVictim.create!(
          case_detail_id:      case_detail_id,
          age_bracket:         age_bracket(case_data),
          full_name:           case_data["Name/s (Write Full Name)"],
          gender:              gender(case_data),
          dependent_type:      dependent_type(case_data),
          ethnic_identity:     case_data["Name/s of Indigenous Peoples’ group or Ethnic Identity/ies of victim/s (If more than on individual, list Indigenous Peoples’ group or Ethnic Identities according to the sequence of Name listed.)"],
          date_of_birth_month: case_data["Date of Birth (Write YYYY-MM-DD) (If more than one individual, list Date of Birth according to the sequ
            ence of Name listed.)"]&.split&.first,
          date_of_birth_day:   case_data["Date of Birth (Write YYYY-MM-DD) (If more than one individual, list Date of Birth according to the sequ
            ence of Name listed.)"]&.split&.second,
          date_of_birth_year:  case_data["Date of Birth (Write YYYY-MM-DD) (If more than one individual, list Date of Birth according to the sequ
            ence of Name listed.)"]&.split&.last,
          victim_role:         victim_role(case_data),
          dependent_details:   case_data["Please provide details of dependents. (E.g., children, partner, grandchildren etc.) (List details of dependents according to the sequence of Name listed.)"],
        )
      end

      def dependent_type(case_data)
        value = case_data["Dependent type (Write WD=with dependents; WOD=without dependents; ND= no data)(If more than one individual, indicate Dependent Type according to the sequence of Name listed.)"]
        DEPENDENT_TRANSLATIONS[value.to_s.upcase] || "no_data"
      end

      def gender(case_data)
        value = case_data["Gender (Write M=Male; F=Female; Z= LGBTQIA+)(If more than one individual, indicate Gender of Individual according to the sequence of Name listed.)"]

        GENDER_TRANSLATIONS[value.to_s.upcase]
      end

      def age_bracket(case_data)
        name = case_data["Age Bracket (Write A= 0-14 years old; B= 15-24 years old; C= 25-59 years old; D= 60 years old and above
          ) (If more than one individual, indicate Age Bracket according to sequence of Name listed.)"]

        AgeBracket.find_by(name: name.to_s.upcase) || AgeBracket.first
      end

      def victim_role(case_data)
        case_data["Role/s of the Victim/s in the Community (The response in this field can be elder, healer or spiritual leader, community organizer, a vocal protester against human rights violations, etc.) (If more than one individual, write Role of the Victim in the Community according to the sequence of Name listed.) This information is meant to capture the victim/s’s involvement in the community and understand why s/he or they was/were the target of human rights violation and/or the impact of the human rights violation against him/her/them to the community or movement."]
      end
    end
  end
end
