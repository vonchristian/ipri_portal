class CreateActionsUndertakens < ActiveRecord::Migration[7.0]
  def change
    create_table :actions_undertakens, id: :uuid do |t|
      t.belongs_to :case_detail, foreign_key: true, null: false, type: :uuid
      t.string :advocacy_or_action
      t.text :advocacy_or_action_details

      t.timestamps
    end
    add_index :actions_undertakens, :advocacy_or_action
  end
end
