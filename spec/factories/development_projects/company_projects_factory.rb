# frozen_string_literal: true

FactoryBot.define do
  factory :company_project, class: "DevelopmentProjects::CompanyProject" do
    company
    development_project
  end
end
