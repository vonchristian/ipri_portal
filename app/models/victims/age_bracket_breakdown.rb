# frozen_string_literal: true

module Victims
  class AgeBracketBreakdown < ApplicationRecord
    self.table_name = "collective_victim_age_bracket_breakdowns"

    belongs_to :collective_victim
    belongs_to :age_bracket

    validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  end
end
