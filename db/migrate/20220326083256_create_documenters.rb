# frozen_string_literal: true

class CreateDocumenters < ActiveRecord::Migration[7.0]
  def change
    create_table :documenters, id: :uuid do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number
      t.belongs_to :country, null: false, foreign_key: true, type: :uuid

      t.timestamps null: false
    end

    add_index :documenters, :email, unique: true
  end
end
