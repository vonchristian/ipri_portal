# frozen_string_literal: true

module DevelopmentProjects
  class Category < ApplicationRecord
    self.table_name = "development_project_categories"

    validates :name, presence: true, uniqueness: true
  end
end
