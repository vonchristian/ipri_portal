# frozen_string_literal: true

module Spreadsheets
  module DraftCaseImports
    class Criminalization < ActiveInteraction::Base
      object :draft_case_detail, class: "CaseDetails::DraftCaseDetail"
      hash :case_data, strip: false

      def execute
        draft_case_detail.update(
          criminalization_details: case_data["Why was/were the victim/s criminalized?"],
          experienced_harrassment_or_intimidation: case_data["Did the victim/s experience any form of harassment or intimidation prior to criminalization?"],
          harrassment_or_intimidation_details: case_data["If yes, please provide more information - Did the victim/s experience any form of harassment or intimidation prior to criminalization?"],
          accusation_or_charges_details: case_data["What was/were the accusation/s or charge/s filed against the victim/s?"],
          policies_or_laws_used: case_data["What was/were the policy/ies or law/s or institutional justification/s used against the victim/s?"],
          accuser_details: case_data["Who put forward the accusation/s or charge/s against the victim/s?"],
          criminalization_case_filing_status: case_data["Was/were the accusation/s or charge/s against the victim legally or formally filed?"],
          criminalization_case_filing_details: case_data["If yes, where was the case/s filed? (e.g., regional court, military court, supreme court, etc.)"],
          case_decision_status: case_data["Is there a decision on the legal or formal accusation/s or charge/s filed against the victim/s?"],
          case_decision_details: case_data["Please provide more information - Is there a decision on the legal or formal accusation/s or charge/s filed against the victim/s?"],
          victims_in_detention: case_data["Is/Are the victim/s in prison or detention facility?"],
          victims_in_detention_details: case_data["If no, please provide more information on the current situation of the victim/s—Is/Are s/he/they in hiding? Released on bail? Awaiting court trial? On house arrest? etc."].presence || case_data["If yes, please provide more information on their conditions or situation in the prison or detention facility—do they know where is the prison or detention facility located? Are they allowed visitors?"],
          case_filing_against_perpetrator: case_data["Has there been any investigation/s on the incident of criminalization?"],
          case_filing_against_perpetrator_details: case_data["If no, please elaborate on your response. (e.g. can you provide probable reasons on why there has been no investigation/s conducted? Or, is the case not yet publicly reported? Etc.)"].presence || case_data["If yes, please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institutions, United Nations body, etc."],
          state_action_to_address_criminalization: case_data["Has the State undertaken any action/s to address the incident of criminalization?"],
        )
      end
    end
  end
end
