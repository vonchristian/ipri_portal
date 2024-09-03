class AddKillingsCountToCaseDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :case_details, :killings_count, :integer
    add_column :case_details, :individual_victims_count, :integer
    add_column :case_details, :collective_victims_count, :integer
    add_column :case_details, :criminalizations_count, :integer
    add_column :case_details, :human_rights_violations_count, :integer
    add_column :case_details, :development_projects_count, :integer

    add_index :case_details, :killings_count
    add_index :case_details, :individual_victims_count
    add_index :case_details, :collective_victims_count
    add_index :case_details, :criminalizations_count
    add_index :case_details, :human_rights_violations_count
    add_index :case_details, :development_projects_count
  end
end
