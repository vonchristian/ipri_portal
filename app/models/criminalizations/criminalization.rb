# frozen_string_literal: true

module Criminalizations
  class Criminalization < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    has_many :accuserizations, dependent: :destroy
    has_many :accuser_categories, through: :accuserizations

    def self.submitted_current_year
      joins(:case_detail).where('case_details.submission_date_year' => Date.current.year)
    end
  end
end
