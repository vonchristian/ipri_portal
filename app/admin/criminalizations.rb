# frozen_string_literal: true
#

ActiveAdmin.register Criminalizations::Criminalization, as: "Criminalizations" do
  menu false
  actions :all, except: [:new, :destroy]
  permit_params :criminalization_details,
                :accusation_or_charges_details,
                :experienced_harrassment_or_intimidation,
                :accuser_details,
                :case_filing_status,
                :case_filing_details,
                :case_decision_status,
                :case_decision_details,
                :victims_in_detention,
                :victims_in_detention_details,
                :case_filing_against_perpetrator,
                :case_filing_against_perpetrator_details,
                :state_action_to_address_criminalization,
                :state_action_to_address_criminalization_details,
                :investigation_on_criminalization,
                :investigation_on_criminalization_details,
                :impact_to_victim_details,
                :impact_to_community_details

  action_item :back do
    link_to "Back to Case Factsheet", admin_case_factsheet_path(resource.case_detail_id), method: :get
  end

  show do |criminalization|

    attributes_table do
      row "Why was/were the victim/s criminalized?", &:criminalization_details
      row "Did the victim/s experience any form of harassment or intimidation prior to criminalization?", &:experienced_harrassment_or_intimidation
      row "What was/were the accusation/s or charge/s filed against the victim/s?", &:accusation_or_charges_details
      row "What was/were the policy/ies or law/s or institutional justification/s used against the victim/s?", &:policies_or_laws_used
      row "Who put forward the accusation/s or charge/s against the victim/s?" do
        criminalization.accuser_categories.map{|a| a.title }.join(", ")
      end
      row "Please provide more information about the accuser/s", &:accuser_details
      row "Was/were the accusation/s or charge/s against the victim legally or formally filed?", &:case_filing_status
      row "Please provide more information. (e.g. Where was the case/s filed? (e.g., regional court, military court, supreme court, etc.)", &:case_filing_details
      row "Is there a decision on the legal or formal accusation/s or charge/s filed against the victim/s?", &:case_decision_status
      row "Please provide more information on the decision on the legal or formal charges filed against the victim/s", &:case_decision_details
      row "Is/Are the victim/s in prison or detention facility?", &:victims_in_detention
      row "Please provide more information on the current situation of the victim/s—Is/Are s/he/they in hiding? Released on bail? Awaiting court trial? On house arrest? etc", &:victims_in_detention_details
      row "Was/Were there (a) legal case/s filed against the alleged perpetrators on behalf of the victim/s criminalized?", &:case_filing_against_perpetrator
      row "Please elaborate on your response (e.g. can you provide probable reasons on why there has been no legal case/s filed against the alleged perpetrators? Etc.)", &:case_filing_against_perpetrator_details
      row "Has the State undertaken any action/s to address the incident of criminalization?", &:state_action_to_address_criminalization
      row "Please provide more information on the action/s undertaken, including any relevant results", &:state_action_to_address_criminalization_details
      row "Has there been any investigation/s on the incident of criminalization?", &:investigation_on_criminalization
      row "Please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institutions, United Nations body, etc", &:investigation_on_criminalization_details
      row "How did the incident/s affect the victim/s and his/her/their family?", &:impact_to_victim_details
      row "How did the incident/s affect the Indigenous Peoples group/s or community/ies and/or organization of the victim/s?", &:impact_to_community_details
    end
  end
  form do |f|
    f.inputs do
      f.input :criminalization_details, label: "Why was/were the victim/s criminalized?"
      f.input :experienced_harrassment_or_intimidation, label: "Did the victim/s experience any form of harassment or intimidation prior to criminalization?", as: :select, collection: ["Yes", "No"]
      f.input :accusation_or_charges_details, label: "What was/were the accusation/s or charge/s filed against the victim/s?"
      f.input :accuser_details, label: "Please provide more information about the accuser/s"
      f.input :case_filing_status, label: "Was/were the accusation/s or charge/s against the victim legally or formally filed?", as: :select, collection: Criminalizations::Criminalization::BOOLEAN_STATUSES.values
      f.input :case_filing_details, label: "Please provide more information. (e.g. Where was the case/s filed? (e.g., regional court, military court, supreme court, etc.)", as: :text
      f.input :case_decision_status, label: "Is there a decision on the legal or formal accusation/s or charge/s filed against the victim/s?", as: :select, collection: Criminalizations::Criminalization::BOOLEAN_STATUSES.values
      f.input :case_decision_details, label: "Please provide more information on the decision ovictim/s", as: :text
      f.input :victims_in_detention, label: "Is/Are the victim/s in prison or detention facility?", as: :select, collection: Criminalizations::Criminalization::BOOLEAN_STATUSES.values
      f.input :victims_in_detention_details, label: "Please provide more information on the current situation of the victim/s—Is/Are s/he/they in hiding? Released on bail? Awaiting court trial? On house arrest? etc"
      f.input :case_filing_against_perpetrator, label: "Was/Were there (a) legal case/s filed against the alleged perpetrators on behalf of the victim/s criminalized?", as: :select, collection: Criminalizations::Criminalization::BOOLEAN_STATUSES.values
      f.input :case_filing_against_perpetrator_details, label: "Please elaborate on your response (e.g. can you provide probable reasons on why there has been no legal case/s filed against the alleged perpetrators? Etc.)", as: :text
      f.input :state_action_to_address_criminalization, label: "Has the State undertaken any action/s to address the incident of criminalization?", as: :select, collection: Criminalizations::Criminalization::BOOLEAN_STATUSES.values
      f.input :state_action_to_address_criminalization_details, label: "Please provide more information on the action/s undertaken, including any relevant results", as: :text
      f.input :investigation_on_criminalization, label: "Has there been any investigation/s on the incident of criminalization?", as: :select, collection: Criminalizations::Criminalization::BOOLEAN_STATUSES.values
      f.input :investigation_on_criminalization_details, label: "Please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institutions, United Nations body, etc.", as: :text
      f.input :impact_to_victim_details, label: "How did the incident/s affect the victim/s and his/her/their family?", as: :text
      f.input :impact_to_community_details, label: "How did the incident/s affect the Indigenous Peoples group/s or community/ies and/or organization of the victim/s?", as: :text
    end

    f.actions
  end
end