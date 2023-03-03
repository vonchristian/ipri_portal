# frozen_string_literal: true

module Spreadsheets
  module Imports
    class HumanRightsViolation < ActiveInteraction::Base
      string :case_detail_id
      hash :case_data, strip: false

      def execute
        create_human_rights_violation
      end

      private

      def create_human_rights_violation
        human_rights_violation = HumanRightsViolations::HumanRightsViolation.create!(
          case_detail_id: case_detail_id,
          violation_details: case_data["Why did the victim/s suffer from the human rights violation/s?"],
          alleged_perpetrators_known: nil,
          alleged_perpetrator_details: nil,
          case_filing_status: case_data["Was/Were there legal case/s filed against the alleged perpetrators on behalf of the victim/s?"],
          case_filing_details: nil,
          state_action_to_address_violation: case_data["Is/Are there any other advocacy and/or action/s undertaken"],
          state_action_to_address_violation_details: case_data["Please elaborate on any action/s at national level and indicate the actor who initiated the action/s."],
          investigation_on_violation: case_data["Has there been any investigation/s on the incident of other type of human right violation?"],
          investigation_on_violation_details: nil,
          impact_to_victim_details: case_data["How did the incident/s affect the victim/s and his/her/their family?"],
          impact_to_community_details: case_data["How did the incident/s affect the Indigenous Peoples group/s or community/ies and/or organization of the victim/s?"],

        )
        if categories.present?
          associate_categories(human_rights_violation)
        end
      end

      def categories
        case_data["What was/were the human rights violation/s? (Tick as many as applicable.)"]
      end

      def associate_categories(human_rights_violation)
        categories.split("\n").each do |category_name|
          category = HumanRightsViolations::Category.find_by(title: category_name)
          if category.present?
            human_rights_violation.categories << category
          end
        end
      end
    end
  end
end
