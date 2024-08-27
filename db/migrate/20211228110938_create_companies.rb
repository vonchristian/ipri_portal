# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies, id: :uuid do |t|
      t.belongs_to :country, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
