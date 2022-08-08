class AddCaseCountToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :case_count, :integer
    add_index :countries, :case_count
  end
end
