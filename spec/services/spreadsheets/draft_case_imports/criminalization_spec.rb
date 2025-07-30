# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Spreadsheets::DraftCaseImports::Criminalization, type: :service) do
  let(:draft_case_detail) { create(:draft_case_detail) }
  let(:case_data) do
    {
      "Why was/were the victim/s criminalized?" => "Criminalization Details answer",
      "Did the victim/s experience any form of harassment or intimidation prior to criminalization?" => "Experienced Harrassment or Intimidation answer",
      "If yes, please provide more information - Did the victim/s experience any form of harassment or intimidation prior to criminalization?" => "Experienced Harrassment or Intimidation Details answer",
      "What was/were the accusation/s or charge/s filed against the victim/s?" => "Accusation or Charges Details answer",
      "What was/were the policy/ies or law/s or institutional justification/s used against the victim/s?" => "Policies or Laws Used answer",
      "Who put forward the accusation/s or charge/s against the victim/s?" => "Accuser Details answer",
      "Was/were the accusation/s or charge/s against the victim legally or formally filed?" => "Case Filing Status answer",
      "If yes, where was the case/s filed? (e.g., regional court, military court, supreme court, etc.)" => "Case Filing Details answer",
      "Is there a decision on the legal or formal accusation/s or charge/s filed against the victim/s?" => "Case Decision Status answer",
      "Please provide more information - Is there a decision on the legal or formal accusation/s or charge/s filed against the victim/s?" => "Case Decision Details answer",
      "Is/Are the victim/s in prison or detention facility?" => "Victims in Detention answer",
      "If no, please provide more information on the current situation of the victim/s—Is/Are s/he/they in hiding? Released on bail? Awaiting court trial? On house arrest? etc." => "Victims in Detention Details answer",
      "Has there been any investigation/s on the incident of criminalization?" => "Case Filing Against Perpetrator answer",
      "If no, please elaborate on your response. (e.g. can you provide probable reasons on why there has been no investigation/s conducted? Or, is the case not yet publicly reported? Etc.)" => "Case Filing Against Perpetrator Details answer",
      "Has the State undertaken any action/s to address the incident of criminalization?" => "State Action to Address Criminalization answer",

    }
  end

  describe "#execute" do
    before do
      described_class.run(draft_case_detail: draft_case_detail, case_data: case_data)
    end

    it { expect(draft_case_detail.reload.criminalization_details).to(eq("Criminalization Details answer")) }
    it { expect(draft_case_detail.reload.experienced_harrassment_or_intimidation).to(eq("Experienced Harrassment or Intimidation answer")) }
    it { expect(draft_case_detail.reload.harrassment_or_intimidation_details).to(eq("Experienced Harrassment or Intimidation Details answer")) }
    it { expect(draft_case_detail.reload.accusation_or_charges_details).to(eq("Accusation or Charges Details answer")) }
    it { expect(draft_case_detail.reload.policies_or_laws_used).to(eq("Policies or Laws Used answer")) }
    it { expect(draft_case_detail.reload.accuser_details).to(eq("Accuser Details answer")) }
    it { expect(draft_case_detail.reload.criminalization_case_filing_status).to(eq("Case Filing Status answer")) }
    it { expect(draft_case_detail.reload.criminalization_case_filing_details).to(eq("Case Filing Details answer")) }
    it { expect(draft_case_detail.reload.case_decision_status).to(eq("Case Decision Status answer")) }
    it { expect(draft_case_detail.reload.case_decision_details).to(eq("Case Decision Details answer")) }
    it { expect(draft_case_detail.reload.victims_in_detention).to(eq("Victims in Detention answer")) }
    it { expect(draft_case_detail.reload.victims_in_detention_details).to(eq("Victims in Detention Details answer")) }
    it { expect(draft_case_detail.reload.case_filing_against_perpetrator).to(eq("Case Filing Against Perpetrator answer")) }
    it { expect(draft_case_detail.reload.case_filing_against_perpetrator_details).to(eq("Case Filing Against Perpetrator Details answer")) }
    it { expect(draft_case_detail.reload.state_action_to_address_criminalization).to(eq("State Action to Address Criminalization answer")) }
  end
end
