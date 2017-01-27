class RatingsController < ApplicationController

  def new
  	@category = Category.find params[:category_id]
    @recipe = Recipe.find params[:recipe_id]
    @rating = Rating.new
  end

  def create
  	@category = Category.find params[:category_id]
  	@recipe = Recipe.find params[:recipe_id]
  	@rating = @recipe.ratings.new(rating_params)
  	@rating.user = current_user
  	if @rating.save
      update_average
      redirect_to category_recipe_url(@category, @recipe)
  	# if user wants to update rating
  	elsif Rating.where(recipe: @recipe, user: current_user)
  		if Rating.where(recipe: @recipe, user: current_user).update(rating_params)
        update_average
  			redirect_to category_recipe_url(@category, @recipe)
  		end
  	else
  		redirect_to new_category_recipe_rating_path(@category, @recipe)
  	end
  end

  def edit
  end

  def update
  end

private
  def rating_params
  	params.require(:rating).permit(:rate, :user, :recipe)
  end

  def update_average
    new_average = @rating.recipe.average_rating
    @rating.recipe.update_attributes(average: new_average)
  end
end
