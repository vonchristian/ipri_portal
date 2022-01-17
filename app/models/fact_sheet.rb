# frozen_string_literal: true

class FactSheet < ApplicationRecord

  validates :reference_number, presence: true, uniqueness: true

  has_many :individual_victims, foreign_key: "fact_sheet_id"
  has_many :collective_victims, foreign_key: "fact_sheet_id"
  has_many :criminalizations,   foreign_key: "fact_sheet_id"
end