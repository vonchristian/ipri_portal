class CreateFundingSources < ActiveRecord::Migration[7.0]
  def change
    create_table :funding_sources do |t|
      t.string :name

      t.timestamps
    end
  end
end
