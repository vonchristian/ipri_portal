class AddWillingToShareMoreInfoToCaseDetails < ActiveRecord::Migration[7.2]
  def change
    add_column :case_details, :willing_to_share_more_info, :boolean, default: false
  end
end
