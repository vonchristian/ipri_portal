# frozen_string_literal: true
class Victims::CollectiveVictimCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
