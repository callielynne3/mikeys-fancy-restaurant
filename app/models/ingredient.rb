class Ingredient < ApplicationRecord
  has_many :recipes, through: :ingredients_recipes#, inverse_of: :ingredients
  has_many :ingredients_recipes
end
