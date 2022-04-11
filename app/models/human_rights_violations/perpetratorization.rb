# frozen_string_literal: true

module HumanRightsViolations
  class Perpetratorization < ApplicationRecord
    self.table_name = "human_rights_violation_perpetratorizations"

    belongs_to :human_rights_violation
    belongs_to :perpetrator_category
  end
end
