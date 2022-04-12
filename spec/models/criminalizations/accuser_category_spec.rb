# frozen_string_literal: true

require "rails_helper"

module Criminalizations
  describe AccuserCategory, type: :model do
    describe "validations" do
      it { is_expected.to validate_presence_of :title }
      it "validate unique title" do
        create(:criminalization_accuser_category, title: "Test Title")
        record = build(:criminalization_accuser_category, title: "Test Title")
        record.save

        expect(record.errors[:title]).to include("has already been taken")
      end
    end
  end
end
