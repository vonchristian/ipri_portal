# frozen_string_literal: true

module DevelopmentProjects
  class Category < ApplicationRecord
    self.table_name = "development_project_categories"
    has_many :development_projects, class_name: "DevelopmentProjects::DevelopmentProject", dependent: :nullify, foreign_key: "development_project_category_id"
    has_many :case_details, through: :development_projects, class_name: "CaseDetails::CaseDetail"
    validates :name, presence: true, uniqueness: true

    def update_case_details_count
      update_column(:case_details_count, case_details.count)
    end
  end
end
