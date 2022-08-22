# frozen_string_literal: true

class CreateIndividualVictimCaseDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :individual_victim_case_details, id: :uuid do |t|
      t.belongs_to :victim, null: false, foreign_key: { to_table: :individual_victims }, type: :uuid,
        index: { name: "index_victim_on_individual_victim_details" }
      t.belongs_to :case_detail, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :individual_victim_case_details, [:victim_id, :case_detail_id],
      name: "index_unique_victim_and_case_detail_id_in_victim_case_details"
  end
end
