# frozen_string_literal: true

require "rails_helper"

module Criminalizations
  describe Criminalization do
    describe "associations" do
      it { is_expected.to belong_to :case_detail }
      it { is_expected.to have_many(:accuserizations).dependent(:destroy) }
      it { is_expected.to have_many :accuser_categories }
    end
  end
end
