# frozen_string_literal: true

module HumanRightsViolations
  class HumanRightsViolation < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
  end
end
