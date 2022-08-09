# frozen_string_literal: true

module Killings
  class Killing < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
    has_many :perpetratorizations
    has_many :killing_perpetrator_categories, through: :perpetratorizations

    def self.submitted_current_year
      joins(:case_detail).where('case_details.submission_date_year' => Date.current.year)
    end
  end
end
