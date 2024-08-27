# frozen_string_literal: true

FactoryBot.define do
  factory :human_rights_violation_categorization, class: "HumanRightsViolations::Categorization" do
    human_rights_violation
    category factory: [:human_rights_violation_category]
  end
end
