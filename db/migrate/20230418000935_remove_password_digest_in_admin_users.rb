class RemovePasswordDigestInAdminUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :admin_users, :password_digest, :string
  end
end
