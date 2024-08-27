# frozen_string_literal: true

class RemoveCompanyCountryReference < ActiveRecord::Migration[7.0]
  def change
    change_column_null :companies, :country_id, true
  end
end
