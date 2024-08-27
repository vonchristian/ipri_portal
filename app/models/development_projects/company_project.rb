# frozen_string_literal: true

module DevelopmentProjects
  class CompanyProject < ApplicationRecord
    belongs_to :company
    belongs_to :development_project

    validates :development_project_id, uniqueness: { scope: :company_id }
  end
end
