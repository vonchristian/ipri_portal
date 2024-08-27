# frozen_string_literal: true

FactoryBot.define do
  factory :case_project do
    case_detail { nil }
    development_project { nil }
  end
end
