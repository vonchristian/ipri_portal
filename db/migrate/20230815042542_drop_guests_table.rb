# frozen_string_literal: true

class DropGuestsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :guests
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
