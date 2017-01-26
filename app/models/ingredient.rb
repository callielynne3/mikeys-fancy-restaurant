class Ingredient < ApplicationRecord
  has_many :recipes, through: :ingredients_recipes
end
