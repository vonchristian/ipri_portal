# frozen_string_literal: true

FactoryBot.define do
  factory :human_rights_violation_categorization, class: "HumanRightsViolations::Categorization" do
    association :human_rights_violation
    association :category, factory: :human_rights_violation_category
  end
end
