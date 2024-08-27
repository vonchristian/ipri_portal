# frozen_string_literal: true

FactoryBot.define do
  factory :development_project, class: "DevelopmentProjects::DevelopmentProject" do
    name { Faker::Company.name }
    description { Faker::Company.bs }
  end
end
