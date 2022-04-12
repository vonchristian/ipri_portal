class CreateDevelopmentProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :development_projects, id: :uuid do |t|
      t.string :name
      t.text :description
      t.integer :project_start_year
      t.text :website_sources

      t.timestamps
    end
  end
end
