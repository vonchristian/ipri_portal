class AddIndividualVictimsCountToAgeBrackets < ActiveRecord::Migration[7.2]
  def change
    add_column :age_brackets, :individual_victims_count, :integer, null: false, default: 0
  end
end
