# frozen_string_literal: true

FactoryBot.define do
  factory :action_taken, class: "CaseDetails::ActionTaken" do
    case_detail
  end
end
