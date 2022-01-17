class CreateKillings < ActiveRecord::Migration[7.0]
  def change
    create_table :killings do |t|
      t.belongs_to :temp_fact_sheet,foreign_key: true
      t.text :killing_details
      t.text :killing_carried_out
      t.string :experienced_harrassment_or_intimidation
      t.text :harrassment_or_intimidation_details
      t.string :alleged_perpetrators_known
      t.string :case_filing_status
      t.text :case_filing_details
      t.string :state_action_to_address_killing
      t.text :state_action_to_address_killing_details
      t.string :investigation_on_killing
      t.text :investigation_on_killing_details
      t.text :impact_to_victim_details
      t.text :impact_to_community_details

      t.timestamps
    end
    add_index :killings, :experienced_harrassment_or_intimidation
    add_index :killings, :alleged_perpetrators_known
    add_index :killings, :case_filing_status
    add_index :killings, :state_action_to_address_killing
    add_index :killings, :investigation_on_killing
  end
end
