class AddCollectiveVictimCategoryToCollectiveVictims < ActiveRecord::Migration[7.2]
  def change
    add_reference :collective_victims, :collective_victim_category, foreign_key: true, type: :uuid
  end
end
