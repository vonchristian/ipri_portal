# frozen_string_literal: true

FactoryBot.define do
  factory :criminalization, class: "Criminalizations::Criminalization" do
    case_detail
  end
end
