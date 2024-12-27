# frozen_string_literal: true

module DevelopmentProjects
  class CaseProject < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    belongs_to :development_project

    after_create :update_case_details_count

    private

    def update_case_details_count
      development_project.category.update_case_details_count
    end
  end
end
