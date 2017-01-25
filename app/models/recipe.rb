class Recipe < ApplicationRecord
  belongs_to :category
  has_many :ingredients
end