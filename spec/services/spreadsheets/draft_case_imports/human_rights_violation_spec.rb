# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Spreadsheets::DraftCaseImports::HumanRightsViolation, type: :service) do
  let(:draft_case_detail) { create(:draft_case_detail) }
  let(:case_data) do
    {
      "Why did the victim/s suffer from the human rights violation/s?" => "Violation Details answer",
      "Is/Are the alleged perpetrator/s known?" => "Alleged Perpetrators Known answer",
      "Was/Were there legal case/s filed against the alleged perpetrators on behalf of the victim/s?" => "Case Filing Status answer",
      "If yes, please provide further information: Where is/are the case/s filed? Who filed the case? E.g., victim, family of the victim, support organizations, etc.; any other details of the case/s filed, please share." => "Case Filing Details answer",
      "Is/Are there any other advocacy and/or action/s undertaken" => "State Action to Address Violation answer",
      "Please elaborate on any action/s at national level and indicate the actor who initiated the action/s." => "State Action to Address Violation Details answer",
      "Has there been any investigation/s on the incident of other type of human right violation?" => "Investigation on Violation answer",
      "If yes, please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institution, United Nations body, etc." => "Investigation on Violation Details answer",
      "How did the incident/s affect the victim/s and his/her/their family?" => "Impact to Victim Details answer",
      "How did the incident/s affect the Indigenous Peoples group/s or community/ies and/or organization of the victim/s?" => "Impact to Community Details answer",
    }
  end

  describe "#execute" do
    before do
      described_class.run(draft_case_detail: draft_case_detail, case_data: case_data)
    end

    it { expect(draft_case_detail.reload.violation_details).to(eq("Violation Details answer")) }
    it { expect(draft_case_detail.reload.violation_alleged_perpetrators_known).to(eq("Alleged Perpetrators Known answer")) }
    it { expect(draft_case_detail.reload.violation_alleged_perpetrator_details).to(be_nil) }
    it { expect(draft_case_detail.reload.human_rights_violation_case_filing_status).to(eq("Case Filing Status answer")) }
    it { expect(draft_case_detail.reload.human_rights_violation_case_filing_details).to(eq("Case Filing Details answer")) }
    it { expect(draft_case_detail.reload.state_action_to_address_violation).to(eq("State Action to Address Violation answer")) }
    it { expect(draft_case_detail.reload.state_action_to_address_violation_details).to(eq("State Action to Address Violation Details answer")) }
    it { expect(draft_case_detail.reload.investigation_on_violation).to(eq("Investigation on Violation answer")) }
    it { expect(draft_case_detail.reload.investigation_on_violation_details).to(eq("Investigation on Violation Details answer")) }
  end
end
