# frozen_string_literal: true

module Killings
  class Perpetratorization < ApplicationRecord
    self.table_name = "killing_perpetratorizations"
    belongs_to :killing
    belongs_to :perpetrator_category

    validates :perpetrator_category_id, uniqueness: { scope: :killing_id }
  end
end
