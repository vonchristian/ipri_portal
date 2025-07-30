# frozen_string_literal: true

FactoryBot.define do
  factory :documenter, class: "Users::Documenter" do
    association :country
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { "secret123" }
    password_confirmation { "secret123" }
  end
end
