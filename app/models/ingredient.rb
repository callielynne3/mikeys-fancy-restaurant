class Ingredient < ApplicationRecord
  has_many :recipes, through: :ingredients_recipes
  has_many :ingredients_recipes
end
