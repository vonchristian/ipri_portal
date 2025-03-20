class AddIncidentInvestigationStatusToCaseDetails < ActiveRecord::Migration[7.2]
  def change
    add_column :case_details, :incident_investigation_status, :boolean
    add_column :case_details, :incident_investigation_details, :text
  end
end
