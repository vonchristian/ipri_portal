# frozen_string_literal: true

module Spreadsheets
  module DraftCaseImports
    class Killing < ActiveInteraction::Base
      object :draft_case_detail, class: "CaseDetails::DraftCaseDetail"
      hash :case_data, strip: false

      def execute
        draft_case_detail.update(
          killing_details: case_data["Why was/were the victim/s killed?"],
          killing_carried_out: case_data["How was the killing carried out?"],
          killing_experienced_harrassment_or_intimidation: case_data["Did the victim/s experience any form of harassment or intimidation prior to the killing? E.g. death threats,  etc."],
          killing_harrassment_or_intimidation_details: case_data["If yes, please provide more information."],
          killing_alleged_perpetrators_known: case_data["Is/Are the alleged perpetrator/s known?"],
          killing_alleged_perpetrator_details: case_data["(Tick as many as applicable)"],
          killing_case_filing_status: case_data["Was/Were there (a) legal case/s filed against the alleged perpetrators on behalf of the victim/s killed?"],
          state_action_to_address_killing: case_data["Has the State undertaken any action/s to address the incident of killing?"],
          state_action_to_address_killing_details: case_data["If yes, please provide further information: Where is/are the case/s filed? Who filed the case? E.g., victim, family of the victim, support organizations, etc.; any other details of the case/s filed, please share."],
          investigation_on_killing: case_data["Has there been any investigation/s on the incident of killing?"],
          investigation_on_killing_details: case_data["If yes, please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institution, United Nations body, etc."],
        )
      end
    end
  end
end
