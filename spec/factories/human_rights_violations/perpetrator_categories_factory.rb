# frozen_string_literal: true

FactoryBot.define do
  factory :human_rights_violations_perpetrator_category, class: "HumanRightsViolations::PerpetratorCategory" do
    title { "Title #{SecureRandom.hex}" }
  end
end
