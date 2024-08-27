# frozen_string_literal: true

FactoryBot.define do
  factory :development_project_categorization do
    development_project { nil }
    category { nil }
  end
end
