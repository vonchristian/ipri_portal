class IndividualVictim < ApplicationRecord
  belongs_to :temp_fact_sheet, class_name: "Tmps::FactSheet"
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
