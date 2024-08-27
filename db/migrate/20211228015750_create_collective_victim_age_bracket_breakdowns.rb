# frozen_string_literal: true

class CreateCollectiveVictimAgeBracketBreakdowns < ActiveRecord::Migration[7.0]
  def change
    create_table :collective_victim_age_bracket_breakdowns, id: :uuid do |t|
      t.belongs_to :collective_victim,
        null: false,
        foreign_key: true,
        type: :uuid,
        index: { name: "index_collective_victim_breakdowns_on_collective_victim_id" }
      t.belongs_to :age_bracket,
        null: false,
        foreign_key: true,
        type: :uuid,
        index: { name: "index_collective_victim_breakdowns_on_age_bracket_id" }
      t.integer :total

      t.timestamps
    end
  end
end
