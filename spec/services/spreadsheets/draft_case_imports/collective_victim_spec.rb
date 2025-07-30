# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Spreadsheets::DraftCaseImports::CollectiveVictim, type: :service) do
  let(:draft_case_detail) { create(:draft_case_detail) }
  let(:case_data) do
    {
      "Number of affected people" => 10,
      "Does the number of affected people refer to individuals" => "yes",
      "Write the number of male from the total number of individuals affected:" => 5,
      "Write the number of female from the total number of individuals affected:" => 5,
      "Write the number of 0-12 years old from the total number of individuals affected:" => 2,
      "Write the number of 13-25 years old from the total number of individuals affected:" => 2,
      "Write the number of 26-35 years old from the total number of individuals affected:" => 2,
      "Write the number of 36-59 years old from the total number of individuals affected:" => 2,
      "Write the number of 60 and above years old from the total number of individuals affected:" => 2
    }
  end

  describe "#execute" do
    before do
      described_class.run(draft_case_detail: draft_case_detail, case_data: case_data)
    end

    it { expect(draft_case_detail.reload.affected_total).to(eq("10")) }
    it { expect(draft_case_detail.reload.refer_to_individuals).to(be(true)) }
    it { expect(draft_case_detail.reload.male_total).to(eq(5)) }
    it { expect(draft_case_detail.reload.female_total).to(eq(5)) }
    it { expect(draft_case_detail.reload.age_bracket_breakdown_0_12).to(eq(2)) }
    it { expect(draft_case_detail.reload.age_bracket_breakdown_13_25).to(eq(2)) }
    it { expect(draft_case_detail.reload.age_bracket_breakdown_26_35).to(eq(2)) }
    it { expect(draft_case_detail.reload.age_bracket_breakdown_36_59).to(eq(2)) }
    it { expect(draft_case_detail.reload.age_bracket_breakdown_60_plus).to(eq(2)) }
  end
end
