ActiveAdmin.register(Killings::Killing, as: "Killings") do
  belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
  menu false
  config.batch_actions = false

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
    :investigation_on_killing_details

  controller do
    def destroy
      killing = Killings::Killing.find(params[:id])
      case_detail = killing.case_detail

      super do |format|
        redirect_to admin_case_detail_path(case_detail), notice: "Killing deleted successfully." and return
      end
    end
  end

  show do |killing|
    panel "Details of Killing" do
      attributes_table do
        row "Why was/were the victim/s killed?", &:killing_details
        row "How was the killing carried out?", hint: "E.g., shooting, bombing, resulted from torture, etc.", &:killing_carried_out
        row "Did the victim/s experience any form of harassment or intimidation prior to criminalization?" do |killing|
          killing.experienced_harrassment_or_intimidation ? "Yes" : "No"
        end

        row "Please provide more information about the harrassment or intimidation", &:harrassment_or_intimidation_details
        row "Is/Are the alleged perpetrator/s known?" do |killing|
          killing.alleged_perpetrators_known ? "Yes" : "No"
        end

        row "Please provide more information about the alleged perpetrator/s", &:alleged_perpetrator_details
      end

      panel "Status of Incident of Killing" do
        attributes_table do
          row "Was/Were there (a) legal case/s filed against the alleged perpetrators on behalf of the victim/s killed?" do |post|
            status = post.case_filing_status ? "Yes" : "No"
            css_class = post.case_filing_status ? "text-green-700 bg-green-100 px-2 py-1 rounded-md" : "text-red-700 bg-red-100 px-2 py-1 rounded-md"
            span status, class: css_class
          end

          row "Please provide further information: Where is/are the case/s filed? Who filed the case? E.g., victim, family of the victim, support organizations, etc.; any other details of the case/s filed, please share.", &:case_filing_details
          row "Has the State undertaken any action/s to address the incident of killing?" do |killing|
            killing.state_action_to_address_killing ? "Yes" : "No"
          end

          row "Please provide more information on the action/s undertaken, including any relevant results.", &:state_action_to_address_killing_details
          row "Has there been any investigation/s on the incident of killing?" do |killing|
            killing.investigation_on_killing ? "Yes" : "No"
          end
          row "Please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institution, United Nations body, etc.", &:investigation_on_killing_details
        end
      end
    end
  end

  form do |f|
    panel "Details of Killing" do
      f.inputs do
        f.input :killing_details, label: "Why was/were the victim/s killed?"
        f.input :killing_carried_out, label: "How was the killing carried out?", hint: "E.g., shooting, bombing, resulted from torture, etc."
        f.input :experienced_harrassment_or_intimidation, as: :boolean, label: "Did the victim/s experience any form of harassment or intimidation prior to criminalization?"
        f.input :harrassment_or_intimidation_details, label: "Please provide more information about the harrassment or intimidation"
        f.input :alleged_perpetrators_known, as: :boolean, label: "Is/Are the alleged perpetrator/s known?"
        f.input  :alleged_perpetrator_details, label: "Please provide more information about the alleged perpetrator/s"
      end
    end

    panel "Status of Incident of Killing" do
      f.inputs do
        f.input :case_filing_status, as: :boolean, label: "Was/Were there (a) legal case/s filed against the alleged perpetrators on behalf of the victim/s killed?"
        f.input :case_filing_details, label: "Please provide further information: Where is/are the case/s filed? Who filed the case? E.g., victim, family of the victim, support organizations, etc.; any other details of the case/s filed, please share."
        f.input :state_action_to_address_killing, as: :boolean, label: "Has the State undertaken any action/s to address the incident of killing?"
        f.input :state_action_to_address_killing_details, label: "Please provide more information on the action/s undertaken, including any relevant results."
        f.input :investigation_on_killing, as: :boolean, label: "Has there been any investigation/s on the incident of killing?"
        f.input :investigation_on_killing_details, label: "If yes, please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institution, United Nations body, etc."
      end
    end

    f.actions
  end
end