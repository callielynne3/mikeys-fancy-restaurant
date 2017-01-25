class Ingredient < ApplicationRecord
  belongs_to :recipe
  # has_many :recipes, :through => :ingredients_recipes
end