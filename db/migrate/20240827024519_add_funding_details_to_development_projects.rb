# frozen_string_literal: true

class AddFundingDetailsToDevelopmentProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :development_projects, :parent_company_country_id, :string
    add_index :development_projects, :parent_company_country_id
    add_column :development_projects, :parent_company_name, :string
    add_column :development_projects, :parent_company_description, :text
    add_column :development_projects, :parent_company_data_sources, :string
    add_column :development_projects, :funding_source_description, :text
    add_column :development_projects, :funding_source_data_sources, :text
  end
end
