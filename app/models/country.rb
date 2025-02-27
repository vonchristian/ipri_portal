# frozen_string_literal: true

class Country < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :text_search, against: [:name], using: { tsearch: { prefix: true } }

  has_many :case_details, class_name: "CaseDetails::CaseDetail"
  has_many :killings, class_name: "Killings::Killing", through: :case_details
  has_many :criminalizations, class_name: "Criminalizations::Criminalization", through: :case_details
  has_many :human_rights_violations, class_name: "HumanRightsViolations::HumanRightsViolation", through: :case_details
  has_many :development_projects, class_name: "DevelopmentProjects::DevelopmentProject", foreign_key: "parent_company_country_id"
  validates :name, presence: true, uniqueness: true

  def self.with_top_cases(limit: 10)
    order(case_details_count: :desc).first(limit)
  end

  def cases_this_year
    case_details.submitted_current_year
  end

  def self.ransackable_associations(auth_object = nil)
    ["case_details", "criminalizations", "development_projects", "human_rights_violations", "killings"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["case_details_count", "criminalizations_count", "human_rights_violations_count", "id", "id_value", "killings_count", "name", "priority"]
  end
end
