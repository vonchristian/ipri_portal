# frozen_string_literal: true

module HumanRightsViolations
  class Categorization < ApplicationRecord
    self.table_name = "human_rights_violation_categorizations"

    belongs_to :human_rights_violation
    belongs_to :category, class_name: "HumanRightsViolations::Category",
      foreign_key: "human_rights_violation_category_id"

    validates :human_rights_violation_category_id, uniqueness: { scope: :human_rights_violation_id }
  end
end
