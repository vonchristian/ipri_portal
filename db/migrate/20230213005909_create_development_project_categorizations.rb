# frozen_string_literal: true

class CreateDevelopmentProjectCategorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :development_project_categorizations, id: :uuid do |t|
      t.belongs_to :project, null: false, foreign_key: { to_table: :development_projects }, type: :uuid
      t.belongs_to :category, null: false, foreign_key: { to_table: :development_project_categories }, type: :uuid

      t.timestamps
    end

    add_index :development_project_categorizations,
      [:project_id, :category_id],
      unique: true,
      name: "index_project_and_category_in_project_categorizations"
  end
end
