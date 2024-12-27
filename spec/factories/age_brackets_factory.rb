# frozen_string_literal: true

FactoryBot.define do
  factory :age_bracket do
    min_age { 1 }
    max_age { 15 }
    name { 'minor' }
  end
end