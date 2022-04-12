FactoryBot.define do
  factory :user, class: "Users::User" do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { "secret123" }
    password_confirmation { "secret123" }
  end
end
