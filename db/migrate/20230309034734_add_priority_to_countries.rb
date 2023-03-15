class AddPriorityToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :priority, :boolean, default: false, index: true
  end
end
