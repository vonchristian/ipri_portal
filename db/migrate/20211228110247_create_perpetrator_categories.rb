class CreatePerpetratorCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :perpetrator_categories do |t|
      t.string :name

      t.timestamps
    end
    add_index :perpetrator_categories, :name, unique: true
  end
end
