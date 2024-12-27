class AddHumanRightsViolationsCountToHumanRightsViolationCategories < ActiveRecord::Migration[7.2]
  def change
    add_column :human_rights_violation_categories, :human_rights_violations_count, :integer, null: false, default: 0
  end
end
