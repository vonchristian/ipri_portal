# frozen_string_literal: true

class CreateCriminalizationAccuserizations < ActiveRecord::Migration[7.0]
  def change
    create_table :criminalization_accuserizations, id: :uuid do |t|
      t.belongs_to :criminalization, null: false, foreign_key: true, type: :uuid
      t.belongs_to :accuser_category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
