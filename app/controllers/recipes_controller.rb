class RecipesController < ApplicationController

  def new
    @category = Category.find params[:category_id]
    @recipe = Recipe.new(:category => @category)
  end

  def show
    @category = Category.find(params[:category_id])
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @ingredient = Ingredient.new
    @rating = Rating.new
    @ratings = @recipe.ratings
    # @recipe.average = @recipe.average_rating
  end

  def edit
    @category = Category.find(params[:category_id])
    @recipe = Recipe.find(params[:id])
  end

  def create
    @category = Category.find params[:category_id]
    @recipe = Recipe.new(recipe_params)
    @recipe.category = @category

    if @recipe.save
      redirect_to category_recipe_path(@category, @recipe)
    else
      flash.now[:error] = "Could not save recipe"
      render :new
    end
  end

  def update
    @category = Category.find(params[:category_id])
    @recipe = Recipe.find(params[:id])
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to category_recipe_path(@category, @recipe), notice: 'Recipe successfully updated' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

private
  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :prep_time, :directions, :creator)
  end

  # def rating_average
  #   sum = 0
  #   @ratings.each do |rating|
  #     sum += rating.rate
  #   end
  #   sum / @ratings.length
  # end

  def rating_average
    5
  end

end
