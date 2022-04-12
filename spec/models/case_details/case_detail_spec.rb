# frozen_string_literal: true

require "rails_helper"

module CaseDetails
  describe CaseDetail do
    describe "associations" do
      it { is_expected.to have_many :individual_victims }
      it { is_expected.to have_many :collective_victims }
      it { is_expected.to have_many :criminalizations }
    end

    describe "validations" do
      subject(:case_detail) { build(:case_detail) }

      it { expect(case_detail).to validate_presence_of(:reference_number) }
      it "unique reference number" do
        create(:case_detail, reference_number: "12345")
        record = build(:case_detail, reference_number: "12345")
        record.save

        expect(record.errors[:reference_number]).to include("has already been taken")
      end
    end
  end
end
