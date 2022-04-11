# frozen_string_literal: true

require "rails_helper"

module HumanRightsViolations
  describe Categorization, type: :model do
    describe "associations" do
      it { is_expected.to belong_to :human_rights_violation }
      it { is_expected.to belong_to :category }
    end
  end
end
