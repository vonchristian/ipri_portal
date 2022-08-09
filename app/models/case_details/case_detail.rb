# frozen_string_literal: true

module CaseDetails
  class CaseDetail < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :text_search, against: [:organization_name, :subnational_location, :location_details_1, :location_details_2, :impact_to_victim_details, :impact_to_community_details],
      associated_against: { country: [:name] },
      using: { tsearch:  { prefix: true } }

    enum data_sharing: {
      restricted: "restricted",
      unrestricted: "unrestricted"
    }
    validates :reference_number, presence: true, uniqueness: true

    belongs_to :documenter,            class_name: "Users::Documenter", foreign_key: "documenter_id"
    belongs_to :country, optional: true
    has_many :individual_victims,      class_name: "Victims::IndividualVictim", foreign_key: "case_detail_id"
    has_many :collective_victims,      class_name: "Victims::CollectiveVictim", foreign_key: "case_detail_id"
    has_many :criminalizations,        class_name: "Criminalizations::Criminalization", foreign_key: "case_detail_id"
    has_many :human_rights_violations, class_name: "HumanRightsViolations::HumanRightsViolation", foreign_key: "case_detail_id"
    has_many :killings,                class_name: "Killings::Killing", foreign_key: "case_detail_id"
    has_many_attached :documents
    has_many :case_projects,           class_name: "DevelopmentProjects::CaseProject"
    has_many :development_projects,    class_name: "DevelopmentProjects::DevelopmentProject", through: :case_projects

    delegate :name, to: :country, prefix: true, allow_nil: true

    def self.submitted_current_year
      where(submission_date_year: Date.current.year)
    end
  end
end