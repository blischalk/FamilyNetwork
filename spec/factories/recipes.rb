FactoryGirl.define do
  factory :recipe do
    id 1
    title "Testing Recipe"
    description "A tasty treat!"
    association :user, factory: :user
    factory :recipe_full, :class => Recipe do |rf|
      rf.ingredient_assignments { |ia| [ia.association(:ingredient_assignment)] }
    end
  end
end
