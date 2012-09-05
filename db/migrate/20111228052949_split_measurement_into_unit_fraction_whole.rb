class SplitMeasurementIntoUnitFractionWhole < ActiveRecord::Migration
  def up
    remove_column :ingredient_assignments, :measurement
    remove_column :tool_assignments, :count

    add_column :ingredient_assignments, :unit, :string
    add_column :ingredient_assignments, :numerator, :integer
    add_column :ingredient_assignments, :denominator, :integer
    add_column :ingredient_assignments, :whole, :integer
    add_column :tool_assignments, :count, :integer
  end

  def down
    remove_column :ingredient_assignments, :unit
    remove_column :ingredient_assignments, :numerator
    remove_column :ingredient_assignments, :denominator
    remove_column :ingredient_assignments, :whole
    remove_column :tool_assignments, :count

    add_column :ingredient_assignments, :measurement, :string
    add_column :tool_assignments, :count, :string
  end
end
