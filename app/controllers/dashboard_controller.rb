class DashboardController < ApplicationController
  def index
    @recipes = Recipe.find(:all, include: :user, limit: 10, order: "created_at DESC")
    @ingredients = Ingredient.find(:all, order: "title ASC")
  end
end
