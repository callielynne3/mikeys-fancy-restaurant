class Recipe < ApplicationRecord
  belongs_to :category
  has_many :ingredients, through: :ingredients_recipes
  has_many :ingredients_recipes
  has_many :ratings
  belongs_to :user, optional: true


  accepts_nested_attributes_for :ingredients

  validates :name, :difficulty, :prep_time, :directions, :creator, presence: true

  def average_rating
    if self.ratings.count > 0
      sum = self.ratings.reduce(0) { |rating_total, rating| rating_total + rating.rate }
      sum / self.ratings.count
    else
      "Not yet rated. :("
    end
  end

  def self.search(search) where("name ILIKE ? OR directions ILIKE ?", "%#{search}%", "%#{search}%")
  end

end
