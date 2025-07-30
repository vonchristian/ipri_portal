# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Spreadsheets::DraftCaseImports::DevelopmentProject, type: :service) do
  let(:draft_case_detail) { create(:draft_case_detail) }
  let(:case_data) do
    {
      "Name of development project/s" => "Development Project Name",
      "Description of development project/s" => "Development Project Description",
      "Indicate year of project's start of operation on the country where the incident of human rights violation happened" => "2023",
      "Source of information on development project" => "https://example.com",
      "Type of Development Project" => "Energy",
    }
  end

  describe "#execute" do
    before do
      described_class.run(draft_case_detail: draft_case_detail, case_data: case_data)
    end

    it { expect(draft_case_detail.reload.project_name).to(eq("Development Project Name")) }
    it { expect(draft_case_detail.reload.project_description).to(eq("Development Project Description")) }
    it { expect(draft_case_detail.reload.project_start_year).to(eq(2023)) }
    it { expect(draft_case_detail.reload.project_website_sources).to(eq("https://example.com")) }
    it { expect(draft_case_detail.reload.development_project_category).to(eq("Energy")) }
  end
end
