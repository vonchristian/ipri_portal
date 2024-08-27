# frozen_string_literal: true

FactoryBot.define do
  factory :company, class: "DevelopmentProjects::Company" do
    name { Faker::Company.name }
    description { Faker::Company.bs }
  end
end
