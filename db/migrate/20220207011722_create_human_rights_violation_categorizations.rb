class CreateHumanRightsViolationCategorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :human_rights_violation_categorizations, id: :uuid do |t|
      t.belongs_to :human_rights_violation, null: false, foreign_key: true, type: :uuid, index: { name: "index_hr_violation_categorizations_on_hr_violation_id" }
      t.belongs_to :human_rights_violation_category, null: false, foreign_key: true, type: :uuid, index: { name: "index_hr_violation_categorizations_on_hr_violation_category_id"}

      t.timestamps
    end
  end
end
