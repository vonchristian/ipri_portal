# frozen_string_literal: true

class AddDocumenterDetailsToCaseDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :case_details, :documenter_first_name, :string
    add_column :case_details, :documenter_last_name, :string
    add_column :case_details, :documenter_email, :string
    add_column :case_details, :documenter_phone_number, :string
    add_column :case_details, :documenter_organization, :string
  end
end
