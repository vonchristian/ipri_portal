class AddAttrsToCaseDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :case_details, :impact_to_victim_details, :text
    add_column :case_details, :impact_to_community_details, :text
    add_column :case_details, :actions_taken_details, :text
    add_column :case_details, :actions_taken_status, :boolean, index: true
  end
end
