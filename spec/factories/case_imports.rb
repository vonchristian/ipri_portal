# frozen_string_literal: true

FactoryBot.define do
  factory :case_import do
    spreadsheet do
      fixture_path = Rails.root.join("spec/fixtures/files/sample.xlsx")
      Rack::Test::UploadedFile.new(fixture_path, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    end
  end
end
