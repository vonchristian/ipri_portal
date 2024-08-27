# frozen_string_literal: true

require "rails_helper"

RSpec.describe DevelopmentProjects::CompanyProject do
  describe "associations" do
    it { is_expected.to belong_to :company }
    it { is_expected.to belong_to :development_project }
  end

  describe "validations" do
    it do
      company = create(:company)
      development_project = create(:development_project)
      create(:company_project, company: company, development_project: development_project)
      record = build(:company_project, company: company, development_project: development_project)
      record.save

      expect(record.errors.full_messages).to match_array("Development project has already been taken")
    end
  end
end
