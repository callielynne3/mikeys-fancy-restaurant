class Recipe < ApplicationRecord
  belongs_to :category
  has_many :ingredients, through: :ingredients_recipes
  has_many :ingredients_recipes
  has_many :ratings
  belongs_to :user, optional: true


  accepts_nested_attributes_for :ingredients

  validates :name, :difficulty, :prep_time, :directions, :creator, presence: true

  def average_rating
    sum = self.ratings.reduce(0) { |rating_total, rating| rating_total + rating.rate }
    sum / self.ratings.count
  end

  def self.search(search) where("name ILIKE ? OR directions ILIKE ?", "%#{search}%", "%#{search}%") 
  end

end
