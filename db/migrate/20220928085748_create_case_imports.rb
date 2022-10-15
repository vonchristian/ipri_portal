# frozen_string_literal: true

class CreateCaseImports < ActiveRecord::Migration[7.0]
  def change
    create_table :case_imports, id: :uuid do |t|
      t.attachment :spreadsheet
      t.timestamps
    end
  end
end
