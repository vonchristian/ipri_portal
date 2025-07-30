# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Spreadsheets::DraftCaseImports::Killing, type: :service) do
  let(:draft_case_detail) { create(:draft_case_detail) }
  let(:case_data) do
    {
      "Why was/were the victim/s killed?" => "Killing Details answer",
      "How was the killing carried out?" => "Killing Carried Out answer",
      "Did the victim/s experience any form of harassment or intimidation prior to the killing? E.g. death threats,  etc." => "Experienced Harrassment or Intimidation answer",
      "If yes, please provide more information." => "Experienced Harrassment or Intimidation Details answer",
      "Is/Are the alleged perpetrator/s known?" => "Alleged Perpetrators Known answer",
      "(Tick as many as applicable)" => "Alleged Perpetrator Details answer",
      "Was/Were there (a) legal case/s filed against the alleged perpetrators on behalf of the victim/s killed?" => "Case Filing Status answer",
      "Has the State undertaken any action/s to address the incident of killing?" => "State Action to Address Killing answer",
      "If yes, please provide further information: Where is/are the case/s filed? Who filed the case? E.g., victim, family of the victim, support organizations, etc.; any other details of the case/s filed, please share." => "State Action to Address Killing Details answer",
      "Has there been any investigation/s on the incident of killing?" => "Investigation on Killing answer",
      "If yes, please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institution, United Nations body, etc." => "Investigation on Killing Details answer",
    }
  end

  describe "#execute" do
    before do
      described_class.run(draft_case_detail: draft_case_detail, case_data: case_data)
    end

    it { expect(draft_case_detail.reload.killing_details).to(eq("Killing Details answer")) }
    it { expect(draft_case_detail.reload.killing_carried_out).to(eq("Killing Carried Out answer")) }
    it { expect(draft_case_detail.reload.killing_experienced_harrassment_or_intimidation).to(eq("Experienced Harrassment or Intimidation answer")) }
    it { expect(draft_case_detail.reload.killing_harrassment_or_intimidation_details).to(eq("Experienced Harrassment or Intimidation Details answer")) }
    it { expect(draft_case_detail.reload.killing_alleged_perpetrators_known).to(eq("Alleged Perpetrators Known answer")) }
    it { expect(draft_case_detail.reload.killing_alleged_perpetrator_details).to(eq("Alleged Perpetrator Details answer")) }
    it { expect(draft_case_detail.reload.killing_case_filing_status).to(eq("Case Filing Status answer")) }
    it { expect(draft_case_detail.reload.state_action_to_address_killing).to(eq("State Action to Address Killing answer")) }
    it { expect(draft_case_detail.reload.state_action_to_address_killing_details).to(eq("State Action to Address Killing Details answer")) }
    it { expect(draft_case_detail.reload.investigation_on_killing).to(eq("Investigation on Killing answer")) }
    it { expect(draft_case_detail.reload.investigation_on_killing_details).to(eq("Investigation on Killing Details answer")) }
  end
end
