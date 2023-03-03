class AddInformationSourceToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :information_source, :text
  end
end
