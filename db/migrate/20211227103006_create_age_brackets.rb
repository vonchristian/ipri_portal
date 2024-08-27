# frozen_string_literal: true

class CreateAgeBrackets < ActiveRecord::Migration[7.0]
  def change
    create_table :age_brackets, id: :uuid do |t|
      t.integer :min_age
      t.integer :max_age
      t.string :name

      t.timestamps
    end
  end
end
