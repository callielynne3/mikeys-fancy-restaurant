User.destroy_all
Category.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Rating.destroy_all

10.times do
  User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "p123")
end

categories = ["Appetizer", "Salad", "Main Course", "Dessert"]

categories.each do |category|
  Category.create!(name: category)
end

difficulty = ["Easy", "Medium", "Hard"]
prep_time = [15, 20, 30, 35, 45, 50, 60, 75, 90, 120, 200]

Category.all.each do |category|
  rand(5..15).times do
    category.recipes.create!(name: Faker::Pokemon.name, difficulty: difficulty.sample, prep_time: prep_time.sample, directions: Faker::Lorem.paragraph, creator: Faker::StarWars.character)
  end
end

Recipe.all.each do |recipe|
  rand(0..7).times do
    recipe.ingredients.create!(name: "#{Faker::Food.measurement} #{Faker::Food.spice}")
  end
  rand(0..7).times do
    recipe.ingredients.create!(name: Faker::Food.ingredient)
  end
end

User.all.each do |user|
  p user.ratings.length
  Recipe.all.each do |recipe|
    p recipe.ratings.length
    recipe.ratings.create!(user_id: user.id, rate: rand(1..5))
  end
end

ratings = Rating.all
