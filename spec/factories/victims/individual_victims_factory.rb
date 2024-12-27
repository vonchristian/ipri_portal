# frozen_string_literal: true

FactoryBot.define do
  factory :individual_victim, class: Victims::IndividualVictim do
    association :case_detail
    association :age_bracket
    gender { 'male' }
    full_name { Faker::Name.name }
  end
end