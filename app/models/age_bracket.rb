# frozen_string_literal: true

class AgeBracket < ApplicationRecord
  TRANSLATIONS = {
    "A" => 0..14,
    "B" => 15..24,
    "C" => 25..59,
    "D" => 60..,
  }
  def range
    min_age..max_age
  end

  def range_name
    if range.include?(100)
      "#{min_age} years old and above"
    else
      "#{min_age} - #{max_age} years old"
    end
  end
end
