# frozen_string_literal: true

module HumanRightsViolations
  class Category < ApplicationRecord
    self.table_name = "human_rights_violation_categories"
    has_many :categorizations, class_name: "HumanRightsViolations::Categorization", dependent: :destroy, foreign_key: "human_rights_violation_category_id"
    has_many :human_rights_violations, through: :categorizations

    validates :title, presence: true
  end
end
