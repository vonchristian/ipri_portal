# frozen_string_literal: true

module DevelopmentProjects
  class DevelopmentProject < ApplicationRecord
    belongs_to :parent_company_country, class_name: "Country", optional: true
    belongs_to :category, class_name: 'DevelopmentProjects::Category', optional: true, foreign_key: "development_project_category_id"
    has_many_attached                  :documents, dependent: :destroy

    delegate :name, to: :parent_company_country, prefix: true, allow_nil: true
  end
end
