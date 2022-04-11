FactoryBot.define do
  factory :human_rights_violation_category, class: HumanRightsViolations::Category do
    title { "Title #{SecureRandom.hex}" }
  end
end
