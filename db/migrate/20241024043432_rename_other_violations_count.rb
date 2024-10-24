class RenameOtherViolationsCount < ActiveRecord::Migration[7.2]
  def self.up
    rename_column :countries, :other_violations_count, :human_rights_violations_count
  end

  def self.down
    rename_column :countries, :human_rights_violations_count, :other_violations_count
  end
end

