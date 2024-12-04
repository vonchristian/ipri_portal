class AddDescriptionToDevelopmentProjectCategories < ActiveRecord::Migration[7.2]
  def change
    add_column :development_project_categories, :description, :string
  end
end
