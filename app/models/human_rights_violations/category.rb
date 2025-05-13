# frozen_string_literal: true

module HumanRightsViolations
  class Category < ApplicationRecord
    self.table_name = "human_rights_violation_categories"
    has_many :categorizations, class_name: "HumanRightsViolations::Categorization", dependent: :destroy, foreign_key: "human_rights_violation_category_id"
    has_many :human_rights_violations, through: :categorizations
    has_many :case_details, through: :human_rights_violations

    validates :title, presence: true

    def self.fpic 
      find_by(title: "Violation of collective right to free, prior and informed consent")
    end

    def self.arbitrary_detention
      find_by(title: "Arbitrary detention")
    end

    def self.kidnapping
      find_by(title: "Kidnapping")
    end

    def self.sexual_violence
      find_by(title: "Sexual Violence and other forms of gender-based violence")
    end


  end
end
