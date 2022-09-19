# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests, id: :uuid do |t|
      t.string :locale

      t.timestamps
    end
  end
end
