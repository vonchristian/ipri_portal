class CreateKillingsPerpetratorCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :killings_perpetrator_categories do |t|
      t.string :name

      t.timestamps
    end
    add_index :killings_perpetrator_categories, :name, unique: true
  end
end
