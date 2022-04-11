# frozen_string_literal: true

require "rails_helper"

module HumanRightsViolations
  RSpec.describe Perpetrator, type: :model do
    describe "associations" do
      it { is_expected.to belong_to :human_rights_violation }
      it { is_expected.to belong_to :perpetrator_category }
    end
  end
end
