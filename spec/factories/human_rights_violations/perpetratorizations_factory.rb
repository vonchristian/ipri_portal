FactoryBot.define do
  factory :human_rights_violation_perpetratorization, class: "HumanRightsViolations::Perpetratorization" do
    association :human_rights_violation
    association :perpetrator_category, factory: :human_rights_violations_perpetrator_category
  end
end
