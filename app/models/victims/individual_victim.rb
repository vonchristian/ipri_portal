# frozen_string_literal: true

module Victims
  class IndividualVictim < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    belongs_to :age_bracket, counter_cache: :individual_victims_count

    validates :full_name, presence: true

    enum gender: {
      male: "male",
      female: "female",
      lgbtqia: "lgbtqia+"
    }

    enum dependent_type: {
      with_dependents: "with_dependents",
      without_dependents: "without_dependents",
      no_data: "no_data"

    }

    def date_of_birth
      return if date_of_birth_month.blank? || date_of_birth_day.blank? || date_of_birth_year.blank?

      [date_of_birth_month, date_of_birth_day, date_of_birth_year].join("/")
      # "#{date_of_birth_month}/#{date_of_birth_day}/#{date_of_birth_year}"
    end

    def self.ransackable_attributes(auth_object = nil)
      ["age_bracket_id", "case_detail_id", "created_at", "date_of_birth_day", "date_of_birth_month", "date_of_birth_year", "dependent_details", "dependent_type", "ethnic_identity", "full_name", "gender", "id", "updated_at", "victim_role"]
    end
  end
end
