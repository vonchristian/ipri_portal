class UpdateCountryCounterColumns2 < ActiveRecord::Migration[7.2]
  def change
    change_column :countries, :killings_count, :integer, null: false, default: 0
    change_column :countries, :criminalizations_count, :integer, null: false, default: 0
  end
end
