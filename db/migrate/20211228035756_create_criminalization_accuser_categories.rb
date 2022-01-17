class CreateCriminalizationAccuserCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :criminalization_accuser_categories do |t|
      t.belongs_to :criminalization, null: false, foreign_key: true
      t.belongs_to :accuser_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
