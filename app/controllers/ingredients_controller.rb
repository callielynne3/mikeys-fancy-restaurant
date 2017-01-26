class IngredientsController < ApplicationController

  def new
    @category = Category.find params[:category_id]
    @recipe = Recipe.find params[:recipe_id]
    @ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @category = Category.find params[:category_id]
    @recipe = Recipe.find params[:recipe_id]
    @recipe.ingredients << Ingredient.create(ingredient_params)

    redirect_to category_recipe_path(@category, @recipe)
  end

  def update
  end

  def show
  end

private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
