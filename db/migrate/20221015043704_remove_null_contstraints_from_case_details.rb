# frozen_string_literal: true

class RemoveNullContstraintsFromCaseDetails < ActiveRecord::Migration[7.0]
  def change
    change_column_null :case_details, :incident_start_year, true
    change_column_null :case_details, :incident_start_day, true
    change_column_null :case_details, :incident_start_month, true
  end
end
