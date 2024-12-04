class AddIndigenousGroupDescriptionToCollectiveVictims < ActiveRecord::Migration[7.2]
  def change
    add_column :collective_victims, :indigenous_group_description, :string
  end
end
