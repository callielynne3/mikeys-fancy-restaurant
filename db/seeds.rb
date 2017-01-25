User.destroy_all
Category.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

5.times do 
  Ingredient.create!(name: "carrots")
end 