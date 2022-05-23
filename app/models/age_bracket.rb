class AgeBracket < ApplicationRecord
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
