class AgeBracket < ApplicationRecord
  def range
    min_age..max_age
  end

  def range_name
    "#{min_age} - #{max_age} years old"
  end
end
