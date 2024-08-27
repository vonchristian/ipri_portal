# frozen_string_literal: true

class CreateAccuserCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :accuser_categories, id: :uuid do |t|
      t.string :title

      t.timestamps
    end

    add_index :accuser_categories, :title, unique: true
  end
end
