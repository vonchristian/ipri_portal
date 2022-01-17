class CreateProjectFundings < ActiveRecord::Migration[7.0]
  def change
    create_table :project_fundings do |t|
      t.belongs_to :funding_source, null: false, foreign_key: true
      t.belongs_to :development_project, null: false, foreign_key: true
      t.text :funding_description
      t.text :website_sources

      t.timestamps
    end
  end
end
