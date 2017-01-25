class Recipe < ApplicationRecord
  belongs_to :category
  has_many :ingredients

  validates :name, :difficulty, :prep_time, :directions, :creator, presence: true
end
