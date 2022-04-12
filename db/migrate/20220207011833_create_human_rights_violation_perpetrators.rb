class CreateHumanRightsViolationPerpetrators < ActiveRecord::Migration[7.0]
  def change
    create_table :human_rights_violation_perpetratorizations, id: :uuid do |t|
      t.belongs_to :human_rights_violation, null: false, foreign_key: true, type: :uuid, index: { name: "index_hr_violation_perpetrators_on_hr_violation_id" }
      t.belongs_to :perpetrator_category, null: false, foreign_key: { to_table: :human_rights_violation_perpetrator_categories }, type: :uuid, index: { name: "index_hr_violation_perpetrators_on_perpetrator_category_id" }

      t.timestamps
    end
  end
end
