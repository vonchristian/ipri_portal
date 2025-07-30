# frozen_string_literal: true

class CaseDetails::DraftCaseDetail < ApplicationRecord
  belongs_to :case_import
  belongs_to :country, optional: true
  belongs_to :age_bracket, class_name: "AgeBracket", optional: true
end
