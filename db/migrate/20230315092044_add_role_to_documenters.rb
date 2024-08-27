# frozen_string_literal: true

class AddRoleToDocumenters < ActiveRecord::Migration[7.0]
  def change
    add_column :documenters, :role, :string
    add_index :documenters, :role
  end
end
