class Recipe < ApplicationRecord
  belongs_to :category
  has_many :ingredients, through: :ingredients_recipes
  has_many :ingredients_recipes
  has_many :ratings


  accepts_nested_attributes_for :ingredients

  validates :name, :difficulty, :prep_time, :directions, :creator, presence: true

  def self.search(search) where("name ILIKE ? OR directions ILIKE ?", "%#{search}%", "%#{search}%") 
  end

end
