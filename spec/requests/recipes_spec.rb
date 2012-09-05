require 'spec_helper'
require 'factory_girl'
require 'ruby_debug'

describe "Recipes" do
  context "when not logged in" do
    it "can't view a recipe" do
      recipe = FactoryGirl.create(:recipe_full)
      "#{recipe.ingredient_assignment}"
      recipe.should be(1), "#{recipe.inspect}"
    end
    it "can't edit a recipe"
  end
  context "when logged in" do
    it "can view a recipe"
    it "can edit a recipe"
    context "when editing a recipe" do
      context "when adding a tool" do
        it "a group of hidden fields is added to the edit form"
        it "a list item is added under the tools section"
      end
      context "when adding an ingredient" do
        it "a group of hidden fields is added to the edit form"
        it "a list item is added under the ingredients section"
      end
      context "when adding a step" do
        it "a group of hidden fields is added to the edit form"
        it "a list item is added under the steps section"
      end
    end
  end
end
