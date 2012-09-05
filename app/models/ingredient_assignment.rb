class IngredientAssignment < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient

  #validates :, presence: { message: "^Please provide a measurement for each ingredient" }

  # Thanks to radar on #ror irc for this one
  def ingredient_attributes=(attributes)
    self.ingredient = Ingredient.find_or_create_by_title(attributes[:title])
  end
end
