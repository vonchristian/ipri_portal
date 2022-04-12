# frozen_string_literal: true

require "rails_helper"

module HumanRightsViolations
  describe Categorization, type: :model do
    describe "associations" do
      it { is_expected.to belong_to :human_rights_violation }
      it { is_expected.to belong_to :category }
    end

    describe "validations" do
      it "validate uniqueness of human_rights_violation_category_id scoped to human_rights_violation_id" do
        human_rights_violation = create(:human_rights_violation)
        category = create(:human_rights_violation_category)
        create(:human_rights_violation_categorization, human_rights_violation: human_rights_violation, category: category)
        record = build(:human_rights_violation_categorization, human_rights_violation: human_rights_violation, category: category)
        record.save

        expect(record.errors[:human_rights_violation_category_id]).to include("has already been taken")
      end
    end
  end
end
