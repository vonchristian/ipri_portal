# frozen_string_literal: true

require "rails_helper"

RSpec.describe(CaseImport) do
  describe "associations" do
    it { is_expected.to(have_many(:draft_case_details).class_name("CaseDetails::DraftCaseDetail")) }
  end
end
