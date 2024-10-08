# frozen_string_literal: true

module Victims
  class IndividualVictim < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail", counter_cache: :individual_victims_count
    belongs_to :age_bracket

    delegate :range_name, to: :age_bracket, prefix: true

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
  end
end
