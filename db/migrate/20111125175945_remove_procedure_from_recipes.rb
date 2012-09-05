class RemoveProcedureFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :procedure
  end

  def down
    add_column :recipes, :procedure, :string
  end
end
