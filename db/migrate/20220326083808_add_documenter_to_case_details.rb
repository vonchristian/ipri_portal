class AddDocumenterToCaseDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :case_details, :documenter, null: false, type: :uuid, foreign_key: true
  end
end
