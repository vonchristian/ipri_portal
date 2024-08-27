# frozen_string_literal: true

class CreateCaseProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :case_projects, id: :uuid do |t|
      t.belongs_to :case_detail, null: false, foreign_key: true, type: :uuid
      t.belongs_to :development_project, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
