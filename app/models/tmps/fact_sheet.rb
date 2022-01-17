# frozen_string_literal: true

module Tmps
  class FactSheet < ApplicationRecord
    self.table_name = "temp_fact_sheets"

    validates :reference_number, presence: true, uniqueness: true

    has_many :individual_victims, foreign_key: "temp_fact_sheet_id"
    has_many :collective_victims, foreign_key: "temp_fact_sheet_id"
    has_many :criminalizations,   foreign_key: "temp_fact_sheet_id"
  end
end