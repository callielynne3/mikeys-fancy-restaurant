class Ingredient < ApplicationRecord
  belongs_to :ingredients_recipes
  belongs_to :recipe, through :ingredients_recipes
end