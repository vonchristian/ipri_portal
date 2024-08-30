# frozen_string_literal: true

ActiveAdmin.register Killings::Killing, as: "Killing Cases" do
  menu false
  actions :all, except: [:new, :destroy]

  permit_params :killing_details,
                :killing_carried_out,
                :experienced_harrassment_or_intimidation,
                :harrassment_or_intimidation_details,
                :alleged_perpetrators_known,
                :alleged_perpetrator_details,
                :case_filing_status,
                :case_filing_details,
                :state_action_to_address_killing,
                :state_action_to_address_killing_details,
                :investigation_on_killing,
                :investigation_on_killing_details

  action_item :back, only: :show do
    link_to "Back to Case Factsheet", admin_case_factsheet_path(resource.case_detail_id), method: :get
  end

  show do  |killing|
    attributes_table do
      row "Why was/were the victim/s killed?", &:killing_details
      row "How was the killing carried out?", &:killing_carried_out
      row "Did the victim/s experience any form of harassment or intimidation prior to criminalization?", &:experienced_harrassment_or_intimidation
      row "Is/Are the alleged perpetrator/s known?", &:alleged_perpetrators_known
      row "Who put forward the accusation/s or charge/s against the victim/s?" do
        killing.perpetrator_categories.map{|a| a.title }.join(", ")
      end

      row "Please provide more information about the alleged perpetrators", &:alleged_perpetrator_details
      row "Was/Were there (a) legal case/s filed against the alleged perpetrators on behalf of the victim/s killed?", &:case_filing_status
      row "Please provide further information: Where is/are the case/s filed? Who filed the case? E.g., victim, family of the victim, support organizations, etc.; any other details of the case/s filed, please share.", &:case_filing_details
      row "Has the State undertaken any action/s to address the incident of killing?", &:state_action_to_address_killing
      row "Please provide more information on the action/s undertaken, including any relevant results", &:state_action_to_address_killing_details
      row "Has there been any investigation/s on the incident of killing?", &:investigation_on_killing
      row "Please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institution, United Nations body, etc.", &:investigation_on_killing_details
    end
  end

  form do |f|
    f.inputs do
      f.input :killing_details, label: "Why was/were the victim/s killed?", as: :text
      f.input :killing_carried_out, label: "How was the killing carried out?", as: :text
      f.input :experienced_harrassment_or_intimidation, label: "Did the victim/s experience any form of harassment or intimidation prior to criminalization?", as: :select, collection: Criminalizations::Criminalization::BOOLEAN_STATUSES.values
      f.input :alleged_perpetrators_known, label: "Is/Are the alleged perpetrator/s known?", as: :select, collection: Criminalizations::Criminalization::BOOLEAN_STATUSES.values
      f.input :alleged_perpetrator_details, label: "Please provide more information about the alleged perpetrators", as: :text
      f.input :case_filing_status, label: "Was/Were there (a) legal case/s filed against the alleged perpetrators on behalf of the victim/s killed?", as: :select, collection: Criminalizations::Criminalization::BOOLEAN_STATUSES.values
      f.input :case_filing_details, label: "Please provide further information: Where is/are the case/s filed? Who filed the case? E.g., victim, family of the victim, support organizations, etc.; any other details of the case/s filed, please share", as: :text
      f.input :state_action_to_address_killing, label: "Has the State undertaken any action/s to address the incident of killing?", as: :select, collection: Criminalizations::Criminalization::BOOLEAN_STATUSES.values
      f.input :state_action_to_address_killing_details, label: "Please provide more information on the action/s undertaken, including any relevant results", as: :text
      f.input :investigation_on_killing, label: "Has there been any investigation/s on the incident of killing?", as: :select, collection: Criminalizations::Criminalization::BOOLEAN_STATUSES.values
      f.input :investigation_on_killing_details, label: "Please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institution, United Nations body, etc.", as: :text
    end
    f.actions
  end

end