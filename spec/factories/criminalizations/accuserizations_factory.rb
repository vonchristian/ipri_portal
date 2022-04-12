# frozen_string_literal: true

FactoryBot.define do
  factory :criminalization_accuserization, class: "Criminalizations::Accuserization" do
    association :criminalization
    association :accuser_category
  end
end
