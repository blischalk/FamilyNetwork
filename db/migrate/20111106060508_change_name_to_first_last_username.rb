class ChangeNameToFirstLastUsername < ActiveRecord::Migration
  def up
    remove_column :users, :name
    remove_column :users, :username
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_name, :string
  end

  def down
    add_column :users, :name, :string
    add_column :users, :username, :string
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :username
  end
end
