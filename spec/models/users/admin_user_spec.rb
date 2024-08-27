# frozen_string_literal: true

require "rails_helper"

module Users
  RSpec.describe AdminUser do
    describe "validations" do
      it { is_expected.to validate_presence_of :email }
    end
  end
end
