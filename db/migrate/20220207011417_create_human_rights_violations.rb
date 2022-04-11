class CreateHumanRightsViolations < ActiveRecord::Migration[7.0]
  def change
    create_table :human_rights_violations do |t|
      t.belongs_to :case_detail, null: false, foreign_key: true
      t.text :violation_details
      t.string :alleged_perpetrators_known
      t.text :alleged_perpetrator_details
      t.string :case_filing_status
      t.text :case_filing_details
      t.string :state_action_to_address_violation
      t.string :state_action_to_address_violation_details
      t.string :investigation_on_violation
      t.text :investigation_on_violation_details
      t.string :impact_to_victim_details
      t.text :impact_to_community_details

      t.timestamps
    end
    add_index :human_rights_violations, :alleged_perpetrators_known
    add_index :human_rights_violations, :case_filing_status
    add_index :human_rights_violations, :state_action_to_address_violation, name: "index_hr_violations_on_state_action_to_address_violation"
    add_index :human_rights_violations, :investigation_on_violation
  end
end
