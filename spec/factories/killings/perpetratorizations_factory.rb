# frozen_string_literal: true

FactoryBot.define do
  factory :killing_perpetratorization, class: "Killings::Perpetratorization" do
    association :killing
    association :perpetrator_category, factory: :killing_category
  end
end
