# frozen_string_literal: true

module DevelopmentProjects
  class DevelopmentProject < ApplicationRecord
    belongs_to :parent_company_country, class_name: "Country", optional: true
    has_many :categorizations, class_name: "DevelopmentProjects::Categorization", foreign_key: "project_id", dependent: :destroy
    has_many :categories, class_name: "DevelopmentProjects::Category", through: :categorizations

    delegate :name, to: :parent_company_country, prefix: true, allow_nil: true
  end
end
