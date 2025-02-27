# frozen_string_literal: true

module DevelopmentProjects
  class DevelopmentProject < ApplicationRecord
    belongs_to :parent_company_country, class_name: "Country", optional: true
    belongs_to :category, class_name: 'DevelopmentProjects::Category', optional: true, foreign_key: "development_project_category_id", counter_cache: :development_projects_count
    has_many_attached                  :documents, dependent: :destroy

    delegate :name, to: :parent_company_country, prefix: true, allow_nil: true

    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "description", "development_project_category_id", "funding_source_data_sources", "funding_source_description", "id", "id_value", "name", "parent_company_country_id", "parent_company_data_sources", "parent_company_description", "parent_company_name", "project_start_year", "updated_at", "website_sources"]
    end

  end
end
