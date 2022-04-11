class CreateHumanRightsViolationPerpetrators < ActiveRecord::Migration[7.0]
  def change
    create_table :human_rights_violation_perpetratorizations do |t|
      t.belongs_to :human_rights_violation, null: false, foreign_key: true, index: { name: "index_hr_violation_perpetrators_on_hr_violation_id" }
      t.belongs_to :perpetrator_category, null: false, foreign_key: { to_table: :human_rights_violations_perpetrator_categories }, index: { name: "index_hr_violation_perpetrators_on_perpetrator_category_id" }

      t.timestamps
    end
  end
end
