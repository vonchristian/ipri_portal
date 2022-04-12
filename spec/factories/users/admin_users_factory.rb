FactoryBot.define do
  factory :admin_user, class: "Users::AdminUser" do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { "secret123" }
    password_confirmation { "secret123" }
  end
end
