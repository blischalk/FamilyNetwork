class Ingredient < ActiveRecord::Base
  has_many :ingredient_assignments
  has_many :recipes, through: :ingredient_assignments

  validates_presence_of :title, message: "^A recipe must include at lease one ingredient"
  
end
