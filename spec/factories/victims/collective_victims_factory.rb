# frozen_string_literal: true

FactoryBot.define do
  factory :collective_victim, class: Victims::CollectiveVictim do
    association :case_detail
  end
end
