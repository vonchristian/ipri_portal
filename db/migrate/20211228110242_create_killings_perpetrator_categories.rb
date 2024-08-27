# frozen_string_literal: true

class CreateKillingsPerpetratorCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :killing_perpetrator_categories, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
    add_index :killing_perpetrator_categories, :title, unique: true
  end
end
