# frozen_string_literal: true

FactoryBot.define do
  factory :action_taken, class: "CaseDetails::ActionTaken" do
    association :case_detail
  end
end
