class CreateDevelopmentProjectCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :development_project_categories, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
