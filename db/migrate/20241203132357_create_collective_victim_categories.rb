class CreateCollectiveVictimCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :collective_victim_categories, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
    add_index :collective_victim_categories, :name
  end
end
