class AddLocaleToDocumenters < ActiveRecord::Migration[7.0]
  def change
    add_column :documenters, :locale, :string
  end
end
