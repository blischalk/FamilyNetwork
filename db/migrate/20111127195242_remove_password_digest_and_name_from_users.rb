class RemovePasswordDigestAndNameFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :password_digest, :name
  end

  def down
    add_column :users, :password_digest, :string
    add_column :users, :name, :string
  end
end
