class RatingsController < ApplicationController

  def new
  	@category = Category.find params[:category_id]
    @recipe = Recipe.find params[:recipe_id]
    @rating = Rating.new
  end

  def create
  	@category = Category.find params[:category_id]
  	@recipe = Recipe.find params[:recipe_id]
  	@recipe.ratings << Rating.create(rating_params)

  	redirect_to category_recipe_url(@category, @recipe)
  end

  def edit
  end

  def update
  end

private
  def rating_params
  	params.require(:rating).permit(:rate)
  end
end