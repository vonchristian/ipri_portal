# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :case_details, class_name: "CaseDetails::CaseDetail"
  has_many :killings, class_name: "Killings::Killing", through: :case_details
  has_many :criminalizations, class_name: "Criminalizations::Criminalization", through: :case_details
  has_many :human_rights_violations, class_name: "HumanRightsViolations::HumanRightsViolation", through: :case_details

  validates :name, presence: true, uniqueness: true
  before_save :update_counts

  def self.with_top_cases(limit: 10)
    order(case_count: :desc).first(limit)
  end

  def cases_this_year
    case_details.submitted_current_year
  end

  private

  def update_counts
    self.case_count = case_details.size
    self.killings_count = killings.size
    self.criminalizations_count = criminalizations.size
    self.other_violations_count = human_rights_violations.size
  end
end
