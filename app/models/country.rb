# frozen_string_literal: true

class Country < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :text_search, against: [:name], using: { tsearch: { prefix: true } }

  has_many :case_details, class_name: "CaseDetails::CaseDetail"
  has_many :killings, class_name: "Killings::Killing", through: :case_details
  has_many :criminalizations, class_name: "Criminalizations::Criminalization", through: :case_details
  has_many :human_rights_violations, class_name: "HumanRightsViolations::HumanRightsViolation", through: :case_details

  validates :name, presence: true, uniqueness: true

  def self.with_top_cases(limit: 10)
    order(case_details_count: :desc).first(limit)
  end

  def cases_this_year
    case_details.submitted_current_year
  end
end
