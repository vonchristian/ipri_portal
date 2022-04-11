class CreateKillingPerpetratorCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :killing_perpetrator_categories do |t|
      t.belongs_to :killing, null: false, foreign_key: true
      t.belongs_to :perpetrator_category, null: false, foreign_key: { to_table: :killings_perpetrator_categories }

      t.timestamps
    end
  end
end
