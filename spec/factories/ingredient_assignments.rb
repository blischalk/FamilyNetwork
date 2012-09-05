FactoryGirl.define do
  factory :ingredient_assignment, :class => IngredientAssignment do |ia|
    id 1
    unit 'tsp'
    numerator 1
    denominator 2
    whole 1
    ia.association :ingredient
  end 
end
