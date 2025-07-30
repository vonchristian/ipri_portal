# frozen_string_literal: true

module Spreadsheets
  module DraftCaseImports
    class HumanRightsViolation < ActiveInteraction::Base
      object :draft_case_detail, class: "CaseDetails::DraftCaseDetail"
      hash :case_data, strip: false

      def execute
        draft_case_detail.update(
          violation_details: case_data["Why did the victim/s suffer from the human rights violation/s?"],
          violation_alleged_perpetrators_known: case_data["Is/Are the alleged perpetrator/s known?"],
          violation_alleged_perpetrator_details: nil,
          human_rights_violation_case_filing_status: case_data["Was/Were there legal case/s filed against the alleged perpetrators on behalf of the victim/s?"],
          human_rights_violation_case_filing_details: case_data["If yes, please provide further information: Where is/are the case/s filed? Who filed the case? E.g., victim, family of the victim, support organizations, etc.; any other details of the case/s filed, please share."] || case_data["If no, please elaborate on your response. (e.g. can you provide probable reasons on why there has been no legal case/s filed against the alleged perpetrators? Etc.)"],
          state_action_to_address_violation: case_data["Is/Are there any other advocacy and/or action/s undertaken"],
          state_action_to_address_violation_details: case_data["Please elaborate on any action/s at national level and indicate the actor who initiated the action/s."],
          investigation_on_violation: case_data["Has there been any investigation/s on the incident of other type of human right violation?"],
          investigation_on_violation_details: case_data["If yes, please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institution, United Nations body, etc."] || case_data["If no, please elaborate on your response. (e.g. can you provide probable reasons on why there has been no investigation/s on the incident of other type of human right violation? Etc.)"],
        )
      end
    end
  end
end
