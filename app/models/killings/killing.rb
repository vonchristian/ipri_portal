# frozen_string_literal: true

module Killings
  class Killing < ApplicationRecord
    belongs_to :case_detail, class_name: "CaseDetails::CaseDetail", counter_cache: :killings_count
    has_many :perpetratorizations, class_name: "Killings::Perpetratorization", dependent: :destroy
    has_many :perpetrator_categories, through: :perpetratorizations

    accepts_nested_attributes_for :perpetratorizations, reject_if: :all_blank, allow_destroy: true

    def self.submitted_current_year
      joins(:case_detail).where("case_details.submission_date_year" => Date.current.year)
    end

    def victim
      case_detail.individual_victims.first
    end
  end
end
