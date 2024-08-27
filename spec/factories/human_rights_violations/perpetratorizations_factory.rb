# frozen_string_literal: true

FactoryBot.define do
  factory :human_rights_violation_perpetratorization, class: "HumanRightsViolations::Perpetratorization" do
    human_rights_violation
    perpetrator_category factory: [:human_rights_violations_perpetrator_category]
  end
end
