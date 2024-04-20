class RenamePasswordDigestToEncryptedPassword < ActiveRecord::Migration[7.1]
  def change
    #rename_column :users, :password_digest, :encrypted_password if column_exists?(:users, :password_digest)
  end
end
