class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @appetizers = Category.find_by_name('Appetizer').recipes#.sort_by(rate)
    @salads = Category.find_by_name('Salad').recipes
    @mains = Category.find_by_name('Main Course').recipes
    @desserts = Category.find_by_name('Dessert').recipes
  end

  def show
    @category = Category.find(params[:id])
    @recipes = @category.recipes
  end

end
