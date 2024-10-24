class UpdateCountryCounterColumns < ActiveRecord::Migration[7.2]
  def change
    change_column :countries, :case_details_count, :integer, null: false, default: 0
  end
end
