class UpdateCountryCounterColumns3 < ActiveRecord::Migration[7.2]
  def change
    change_column :countries, :human_rights_violations_count, :integer, null: false, default: 0
  end
end
