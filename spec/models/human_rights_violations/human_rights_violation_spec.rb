# frozen_string_literal: true

require "rails_helper"

module HumanRightsViolations
  RSpec.describe HumanRightsViolation do
    describe "associations" do
      it { is_expected.to belong_to :case_detail }
    end
  end
end
