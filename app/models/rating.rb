class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :user_id, uniqueness: :true
end
