# frozen_string_literal: true

FactoryBot.define do
  factory :killing_perpetrator_category, class: "Killings::PerpetratorCategory" do
    title { "Killing Perpetrator Category #{SecureRandom.hex}" }
  end
end
