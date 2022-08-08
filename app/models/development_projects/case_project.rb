module DevelopmentProjects
  class CaseProject < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    belongs_to :development_project
  end
end
