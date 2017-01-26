class Recipe < ApplicationRecord
  belongs_to :category
  has_many :ingredients, through: :ingredients_recipes#, inverse_of: :recipe
  has_many :ingredients_recipes

  accepts_nested_attributes_for :ingredients

  validates :name, :difficulty, :prep_time, :directions, :creator, presence: true
end
