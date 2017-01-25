class RecipesController < ApplicationController

  def new
    @category = Category.find params[:category_id]
    @recipe = Recipe.new(:category => @category)
  end

  def show
  end

  def edit
  end

  def create
    @category = Category.find params[:category_id]
    @recipe = Recipe.new(recipe_params)
    @recipe.category = @category

    if @recipe.save
      redirect_to '/'
    else
      flash.now[:error] = "Could not save recipe"
      render :new
    end
  end

  def update
  end

  def destroy
  end

private
  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :prep_time, :directions, :creator)
  end

end
