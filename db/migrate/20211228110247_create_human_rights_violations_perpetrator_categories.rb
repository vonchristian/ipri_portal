class CreateHumanRightsViolationsPerpetratorCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :human_rights_violations_perpetrator_categories, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
    add_index :human_rights_violations_perpetrator_categories, :title, unique: true
  end
end
