# frozen_string_literal: true

FactoryBot.define do
  factory :criminalization_accuser_category, class: "Criminalizations::AccuserCategory" do
    title { "Accuser Title #{SecureRandom.hex}" }
  end
end
