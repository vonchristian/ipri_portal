class CollectiveVictimAgeBracketBreakdown < ApplicationRecord
  belongs_to :collective_victim
  belongs_to :age_bracket

  validates :total, presence: true, numericality: { greater_than: 0 }
end
