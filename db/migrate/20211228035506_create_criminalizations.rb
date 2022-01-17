class CreateCriminalizations < ActiveRecord::Migration[7.0]
  def change
    create_table :criminalizations do |t|
      t.belongs_to :fact_sheet, foreign_key: true
      t.text :criminalization_details
      t.string :experienced_harrassment_or_intimidation, index: { name: "index_criminalizations_on_harrassment_or_intimidation"}
      t.text :harrassment_or_intimidation_details
      t.text :accusation_or_charges_details
      t.text :policies_or_laws_used
      t.text :accuser_details
      t.string :case_filing_status
      t.string :case_filing_details
      t.string :case_decision_status
      t.string :case_decision_details
      t.string :victims_in_detention
      t.text :victims_in_detention_details
      t.string :case_filing_against_perpetrator
      t.text :case_filing_against_perpetrator_details
      t.string :state_action_to_address_criminalization, index: { name: "index_criminalizations_on_state_action_to_address"}
      t.text :state_action_to_address_criminalization_details
      t.string :investigation_on_criminalization
      t.text :investigation_on_criminalization_details
      t.text :impact_to_victim_details
      t.text :impact_to_community_details

      t.timestamps
    end

    add_index :criminalizations, :case_filing_status
    add_index :criminalizations, :case_decision_status
    add_index :criminalizations, :victims_in_detention
    add_index :criminalizations, :case_filing_against_perpetrator
    add_index :criminalizations, :investigation_on_criminalization
  end
end
