# frozen_string_literal: true

FactoryBot.define do
  factory :draft_case_detail, class: CaseDetails::DraftCaseDetail do
    association :case_import
  end
end
