# frozen_string_literal: true

require "rails_helper"

module HumanRightsViolations
  RSpec.describe Perpetratorization, type: :model do
    describe "associations" do
      it { is_expected.to belong_to :human_rights_violation }
      it { is_expected.to belong_to :perpetrator_category }
    end

    describe "validations" do
      it "validate uniqueness of human_rights_violation_category_id scoped to human_rights_violation_id" do
        human_rights_violation = create(:human_rights_violation)
        category = create(:human_rights_violations_perpetrator_category)
        create(:human_rights_violation_perpetratorization, human_rights_violation: human_rights_violation, perpetrator_category: category)
        record = build(:human_rights_violation_perpetratorization, human_rights_violation: human_rights_violation, perpetrator_category: category)
        record.save

        expect(record.errors[:perpetrator_category_id]).to include("has already been taken")
      end
    end
  end
end
