# frozen_string_literal: true

class CreateCollectiveVictims < ActiveRecord::Migration[7.0]
  def change
    create_table :collective_victims, id: :uuid do |t|
      t.belongs_to :case_detail, foreign_key: true, null: false, type: :uuid
      t.text :affected_total
      t.text :victim_details
      t.boolean :refer_to_individuals
      t.integer :male_total
      t.integer :female_total

      t.timestamps
    end
  end
end
