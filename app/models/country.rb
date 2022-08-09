# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :case_details, class_name: "CaseDetails::CaseDetail"

  validates :name, presence: true, uniqueness: true

  def self.with_top_cases(limit: 10)
    order(case_count: :desc).first(limit)
  end

  def cases_this_year
    case_details.submitted_current_year
  end
end