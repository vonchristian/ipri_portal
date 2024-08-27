# frozen_string_literal: true

class CreateKillingPerpetratorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :killing_perpetratorizations, id: :uuid do |t|
      t.belongs_to :killing, null: false, foreign_key: true, type: :uuid
      t.belongs_to :perpetrator_category,
        null: false,
        type: :uuid,
        foreign_key: { to_table: :killing_perpetrator_categories }

      t.timestamps
    end
  end
end
