class AddToolCountAndIngredientMeasurement < ActiveRecord::Migration
  def up
    add_column :ingredient_assignments, :measurement, :string
    add_column :tool_assignments, :count, :string
  end

  def down
    remove_column :ingredient_asignments, :measurement
    remove_column :tool_assignments, :count
  end
end
