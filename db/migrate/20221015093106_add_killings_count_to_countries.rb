# frozen_string_literal: true

class AddKillingsCountToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :killings_count, :integer
    add_column :countries, :criminalizations_count, :integer
    add_column :countries, :other_violations_count, :integer
  end
end
