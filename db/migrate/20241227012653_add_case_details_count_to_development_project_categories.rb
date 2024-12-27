class AddCaseDetailsCountToDevelopmentProjectCategories < ActiveRecord::Migration[7.2]
  def change
    add_column :development_project_categories, :case_details_count, :integer, null: false, default: 0
  end
end
