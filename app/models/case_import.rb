# frozen_string_literal: true

class CaseImport < ApplicationRecord
  has_attached_file :spreadsheet
  has_many :draft_case_details, class_name: "CaseDetails::DraftCaseDetail"

  validates_attachment :spreadsheet,
    presence: true,
    content_type: {
      content_type: [
        "application/vnd.ms-excel",
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
      ]
    }
end
