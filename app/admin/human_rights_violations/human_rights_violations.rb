ActiveAdmin.register HumanRightsViolations::HumanRightsViolation, as: "RightsViolations" do
  belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
  menu false
  actions :all

  permit_params :violation_details,
    :alleged_perpetrators_known,
    :alleged_perpetrator_details,
    :case_filing_status,
    :case_filing_details,
    :state_action_to_address_violation,
    :state_action_to_address_violation_details
  show do |human_rights_violation|
    panel "Human Rights Violation Details" do
      attributes_table do
        row "What caused the Human Rights Violation?", &:violation_details
        row "Is/Are the alleged perpetrator/s known?", &:alleged_perpetrators_known
        row "Please provide more information for the alleged perpetrators", &:alleged_perpetrator_details
        row "Was/Were there legal case/s filed against the alleged perpetrators on behalf of the victim/s?", &:case_filing_status
        row "Please provide further information of the state of the case", &:case_filing_details
        row "Has there been any investigation/s on the incident of other type of human right violation?", &:state_action_to_address_violation
        row "Please elaborate with additional information on any actions/investigations from other actors (e.g. national human rights institution, United Nations body, CIVIL S, Comm etc and including relevant date/s and institutions office/s or representative/s involved.)", &:state_action_to_address_violation_details
      end
    end
  end

  form do |f|
    panel "Human Rights Violation Details" do
      f.inputs do
        f.input :violation_details, label: "What caused the Human Rights Violation?"
        f.input :alleged_perpetrators_known, as: :boolean,  label: "Is/Are the alleged perpetrator/s known?"
        f.input :case_filing_status, as: :boolean,  label: "Was/Were there legal case/s filed against the alleged perpetrators on behalf of the victim/s?"
        f.input :case_filing_details, label: "Please provide further information of the state of the case"
        f.input :state_action_to_address_violation, as: :boolean, label: "Has there been any investigation/s on the incident of other type of human right violation?"
        f.input :state_action_to_address_violation_details, as: :text, label: "Please elaborate with additional information on any actions/investigations from other actors (e.g. national human rights institution, United Nations body, CIVIL S, Comm etc and including relevant date/s and institutions office/s or representative/s involved.)"
      end
    end

    f.actions
  end
end