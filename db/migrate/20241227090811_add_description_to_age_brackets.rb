class AddDescriptionToAgeBrackets < ActiveRecord::Migration[7.2]
  def change
    add_column :age_brackets, :description, :string
  end
end
