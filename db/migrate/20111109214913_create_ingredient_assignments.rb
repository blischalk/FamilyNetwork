class CreateIngredientAssignments < ActiveRecord::Migration
  def change
    create_table :ingredient_assignments do |t|
      t.integer :recipe_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
