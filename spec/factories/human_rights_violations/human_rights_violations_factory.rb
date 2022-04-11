FactoryBot.define do
  factory :human_rights_violation, class: "HumanRightsViolations::HumanRightsViolation" do
    association :case_detail
    violation_details { "MyText" }
    alleged_perpetrators_known { "MyString" }
    alleged_perpetrator_details { "MyText" }
    case_filing_status { "MyString" }
    case_filing_details { "MyText" }
    state_action_to_address_violation { "MyString" }
    state_action_to_address_violation_details { "MyString" }
    investigation_on_violation { "MyString" }
    investigation_on_violation_details { "MyText" }
    impact_to_victim_details { "MyString" }
    impact_to_community_details { "MyText" }
  end
end
