# frozen_string_literal: true

require "rails_helper"

module Killings
  describe Perpetratorization, type: :model do
    describe "associations" do
      it { is_expected.to belong_to :killing }
      it { is_expected.to belong_to :perpetrator_category }
    end

    describe "validations" do
      it "validate uniqueness of perpetrator_category_id scoped to killing_id" do
        killing = create(:killing)
        category = create(:killing_perpetrator_category)
        create(:killing_perpetratorization, killing: killing, perpetrator_category: category)
        record = build(:killing_perpetratorization, killing: killing, perpetrator_category: category)
        record.save

        expect(record.errors[:perpetrator_category_id]).to include("has already been taken")
      end
    end
  end
end
