# frozen_string_literal: true

FactoryBot.define do
  factory :case_detail, class: "CaseDetails::CaseDetail" do
    reference_number { SecureRandom.hex(8) }
    association :documenter, factory: :user
    organization_name { Faker::Company.name }
    submission_date_year { Date.current.year }
    submission_date_day { Date.current.day }
    submission_date_month { Date.current.month }
    incident_start_year { Date.current.year }
    incident_start_day { Date.current.day }
    incident_start_month { Date.current.month }
    data_sharing { "restricted" }
  end
end
