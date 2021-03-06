# frozen_string_literal: true

module CaseDetails
  class CaseDetail < ApplicationRecord
    enum data_sharing: {
      restricted: "restricted",
      unrestricted: "unrestricted"
    }
    validates :reference_number, presence: true, uniqueness: true

    belongs_to :documenter,            class_name: "Users::Documenter", foreign_key: "documenter_id"
    has_many :individual_victims,      class_name: "Victims::IndividualVictim", foreign_key: "case_detail_id"
    has_many :collective_victims,      class_name: "Victims::CollectiveVictim", foreign_key: "case_detail_id"
    has_many :criminalizations,        class_name: "Criminalizations::Criminalization", foreign_key: "case_detail_id"
    has_many :human_rights_violations, class_name: "HumanRightsViolations::HumanRightsViolation", foreign_key: "case_detail_id"
    has_many :killings,                class_name: "Killings::Killing", foreign_key: "case_detail_id"
    has_many_attached :documents
  end
end