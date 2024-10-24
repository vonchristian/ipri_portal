class RenameCasesCount < ActiveRecord::Migration[7.2]
  def self.up
    rename_column :countries, :case_count, :case_details_count
  end

  def self.down
    rename_column :countries, :case_details_count, :case_count
  end
end
