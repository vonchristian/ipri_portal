# frozen_string_literal: true

FactoryBot.define do
  factory :criminalization, class: "Criminalizations::Criminalization" do
    association :case_detail
  end
end