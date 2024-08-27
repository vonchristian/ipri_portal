# frozen_string_literal: true

module DevelopmentProjects
  class DevelopmentProject < ApplicationRecord
    has_many :categorizations, class_name: "DevelopmentProjects::Categorization", foreign_key: "project_id"
    has_many :categories, class_name: "DevelopmentProjects::Category", through: :categorizations
    has_many :company_projects, class_name: "DevelopmentProjects::CompanyProject"
    has_many :companies, through: :company_projects, class_name: "DevelopmentProjects::Company"
  end
end
