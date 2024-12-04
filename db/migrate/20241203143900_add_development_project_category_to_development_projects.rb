class AddDevelopmentProjectCategoryToDevelopmentProjects < ActiveRecord::Migration[7.2]
  def change
    add_reference :development_projects, :development_project_category, foreign_key: true, type: :uuid
  end
end
