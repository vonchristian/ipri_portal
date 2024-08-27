# frozen_string_literal: true

require "rails_helper"

module Criminalizations
  describe Accuserization do
    describe "associations" do
      it { is_expected.to belong_to :criminalization }
      it { is_expected.to belong_to :accuser_category }
    end

    describe "validations" do
      let(:criminalization) { create(:criminalization) }
      let(:accuser_category) { create(:criminalization_accuser_category) }
      let(:accuserization) { create(:criminalization_accuserization, criminalization: criminalization, accuser_category: accuser_category) }

      it "validate accuser_category_id uniqueness scoped to criminalization_id" do
        record = build(:criminalization_accuserization, criminalization: criminalization, accuser_category: accuser_category)
        record.save

        expect(record.errors[:accuser_category_id]).to include("has already been taken")
      end
    end
  end
end
