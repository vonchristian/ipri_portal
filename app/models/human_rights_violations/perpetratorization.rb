# frozen_string_literal: true

module HumanRightsViolations
  class Perpetratorization < ApplicationRecord
    self.table_name = "human_rights_violation_perpetratorizations"

    belongs_to :human_rights_violation
    belongs_to :perpetrator_category

    validates :perpetrator_category_id, uniqueness: { scope: :human_rights_violation_id }
  end
end
