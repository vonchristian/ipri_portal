# frozen_string_literal: true

module DevelopmentProjects
  class Categorization < ApplicationRecord
    self.table_name = "development_project_categorizations"
    belongs_to :development_project, class_name: "DevelopmentProjects::DevelopmentProject", foreign_key: "project_id"
    belongs_to :category, class_name: "DevelopmentProjects::Category"
  end
end
