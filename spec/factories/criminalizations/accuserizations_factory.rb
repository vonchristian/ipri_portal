# frozen_string_literal: true

FactoryBot.define do
  factory :criminalization_accuserization, class: "Criminalizations::Accuserization" do
    criminalization
    accuser_category
  end
end
