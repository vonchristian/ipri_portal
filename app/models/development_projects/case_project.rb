# frozen_string_literal: true

module DevelopmentProjects
  class CaseProject < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail", counter_cache: :development_projects_count
    belongs_to :development_project
  end
end
