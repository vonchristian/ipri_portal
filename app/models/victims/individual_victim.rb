# frozen_string_literal: true

class IndividualVictim < ApplicationRecord
  belongs_to :fact_sheet
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
end
