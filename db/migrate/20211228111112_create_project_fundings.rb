# frozen_string_literal: true

class CreateProjectFundings < ActiveRecord::Migration[7.0]
  def change
    create_table :project_fundings, id: :uuid do |t|
      t.belongs_to :funding_source, null: false, foreign_key: true, type: :uuid
      t.belongs_to :development_project, null: false, foreign_key: true, type: :uuid
      t.text :funding_description
      t.text :website_sources

      t.timestamps
    end
  end
end
