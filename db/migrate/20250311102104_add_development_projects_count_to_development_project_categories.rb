class AddDevelopmentProjectsCountToDevelopmentProjectCategories < ActiveRecord::Migration[7.2]
  def change
    add_column :development_project_categories, :development_projects_count, :integer
    add_index :development_project_categories, :development_projects_count
  end
end
