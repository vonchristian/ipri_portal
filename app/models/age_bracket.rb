# frozen_string_literal: true

class AgeBracket < ApplicationRecord
  TRANSLATIONS = {
    "A" => 0..14,
    "B" => 15..24,
    "C" => 25..59,
    "D" => 60..,
  }

  has_many :individual_victims, class_name: "Victims::IndividualVictim", dependent: :restrict_with_exception

  def self.chart_data
    self.all.order(:min_age).includes(:individual_victims).map do |age_bracket|
      [
        age_bracket.description,  age_bracket.individual_victims_count

    ]
    end
  end

  def range
    min_age..max_age
  end
end
