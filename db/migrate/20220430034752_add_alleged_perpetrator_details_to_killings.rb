class AddAllegedPerpetratorDetailsToKillings < ActiveRecord::Migration[7.0]
  def change
    add_column :killings, :alleged_perpetrator_details, :text
  end
end
