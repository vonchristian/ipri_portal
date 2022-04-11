# frozen_string_literal: true

module HumanRightsViolations
  class Category < ApplicationRecord
    self.table_name = "human_rights_violation_categories"

    validates :title, presence: true
  end
end
