class CreateToolAssignments < ActiveRecord::Migration
  def change
    create_table :tool_assignments do |t|
      t.integer :recipe_id
      t.integer :tool_id

      t.timestamps
    end
  end
end
