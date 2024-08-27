# frozen_string_literal: true

class CreateIndividualVictims < ActiveRecord::Migration[7.0]
  def change
    create_table :individual_victims, id: :uuid do |t|
      t.belongs_to :age_bracket, null: false, foreign_key: true, type: :uuid
      t.string :full_name
      t.string :gender
      t.string :dependent_type
      t.string :ethnic_identity
      t.string :date_of_birth_month
      t.integer :date_of_birth_day
      t.integer :date_of_birth_year
      t.text :victim_role
      t.text :dependent_details

      t.belongs_to :case_detail, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :individual_victims, :gender
    add_index :individual_victims, :dependent_type
  end
end
