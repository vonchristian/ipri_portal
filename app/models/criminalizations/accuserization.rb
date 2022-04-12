# frozen_string_literal: true


module Criminalizations
  class Accuserization < ApplicationRecord
    self.table_name = "criminalization_accuserizations"

    belongs_to :criminalization
    belongs_to :accuser_category

    validates :accuser_category_id, uniqueness: { scope: :criminalization_id }
  end
end
