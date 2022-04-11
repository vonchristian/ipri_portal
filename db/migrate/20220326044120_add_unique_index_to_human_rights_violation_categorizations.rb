class AddUniqueIndexToHumanRightsViolationCategorizations < ActiveRecord::Migration[7.0]
  def change
    add_index :human_rights_violation_categorizations,
      [:human_rights_violation_category_id, :human_rights_violation_id],
      unique: true, name: "index_hrv_categorizations_on_hrv_category_id_and_hrv_id"
  end
end
