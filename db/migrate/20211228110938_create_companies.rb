class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.belongs_to :country, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
