class CreateCollectiveVictims < ActiveRecord::Migration[7.0]
  def change
    create_table :collective_victims do |t|
      t.belongs_to :temp_fact_sheet, foreign_key: true
      t.text :affected_total
      t.text :victim_details
      t.boolean :refer_to_individuals
      t.integer :male_total
      t.integer :female_total

      t.timestamps
    end
  end
end
