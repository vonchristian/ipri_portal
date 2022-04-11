# frozen_string_literal: true

require "rails_helper"

module HumanRightsViolations
  RSpec.describe Category, type: :model do
    describe "validations" do
      it { is_expected.to validate_presence_of :title }
    end
  end
end
