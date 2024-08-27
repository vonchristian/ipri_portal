# frozen_string_literal: true

class AddPriorityToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :priority, :boolean, default: false
    add_index :countries, :priority
  end
end
