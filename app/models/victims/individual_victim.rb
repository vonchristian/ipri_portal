# frozen_string_literal: true

module Victims
  class IndividualVictim < ApplicationRecord
    belongs_to :case_detail
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
end