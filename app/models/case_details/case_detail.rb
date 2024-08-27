# frozen_string_literal: true

module CaseDetails
  class CaseDetail < ApplicationRecord
    include PgSearch::Model
    acts_as_taggable
    acts_as_taggable_on :tags
    pg_search_scope :text_search,
      against: [
        :organization_name,
        :subnational_location,
        :location_details_1,
        :location_details_2,
        :impact_to_victim_details,
        :impact_to_community_details,
      ],
      associated_against: { country: [:name] },
      using: { tsearch: { prefix: true } }

    enum data_sharing: {
      restricted: "restricted",
      unrestricted: "unrestricted",
    }
    validates :reference_number, presence: true, uniqueness: true

    belongs_to :documenter,            class_name: "Users::Documenter", optional: true
    belongs_to :country,               optional: true, touch: true
    has_many :individual_victims,      class_name: "Victims::IndividualVictim", dependent: :destroy
    has_many :collective_victims,      class_name: "Victims::CollectiveVictim", dependent: :destroy
    has_many :criminalizations,        class_name: "Criminalizations::Criminalization", dependent: :destroy
    has_many :human_rights_violations, class_name: "HumanRightsViolations::HumanRightsViolation", dependent: :destroy
    has_many :killings,                class_name: "Killings::Killing", dependent: :destroy
    has_many_attached                  :documents, dependent: :destroy
    has_many :case_projects,           class_name: "DevelopmentProjects::CaseProject", dependent: :destroy
    has_many :development_projects,    class_name: "DevelopmentProjects::DevelopmentProject", through: :case_projects

    delegate :name, to: :country, prefix: true, allow_nil: true
    DATA_SHARING_OPTIONS = [
      OpenStruct.new(
        name: "restricted",
        description: "The information in this case factsheet can be used by IPRI only in understanding broad trends of criminalization, violence and impunity against Indigenous Peoples but cannot specifically refer to any of the details of this case.",
      ),
      OpenStruct.new(
        name: "unrestricted",
        description: "The information in this case factsheet can be used by IPRI in understanding broad trends of criminalization, violence and impunity against Indigenous Peoples and can specifically refer to any of the details of this case",
      ),
    ]
    def self.submitted_current_year
      where(submission_date_year: Date.current.year)
    end

    def submission_date
      "#{submission_date_month} #{submission_date_day}, #{submission_date_year}"
    end

    def incident_date
      [incident_start_month, incident_start_day, incident_start_year].compact_blank.join(",")
    end

    def data_sharing_content
      return restricted_content if restricted?

      unrestricted_content
    end

    def data_sharing_title
      return restricted_title if restricted?

      unrestricted_title
    end

    def restricted_title
      "Cannot specifically refer to any of the details of this case"
    end

    def unrestricted_title
      "Can specifically refer to any of the details of this case"
    end

    def restricted_content
      "The information in this case factsheet can be used by IPRI only in understanding broad trends of criminalization,
      violence and impunity against Indigenous Peoples but cannot specifically refer to any of the details of this case"
    end

    def unrestricted_content
    end
  end
end
