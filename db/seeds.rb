User.destroy_all
Category.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

3.times do
  User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "p123")
end

categories = ["Appetizer", "Salad", "Main Course", "Dessert"]

categories.each do |category|
  Category.create!(name: category)
end

categories = Category.all

difficulty = ["Easy", "Medium", "Hard"]
prep_time = [15, 20, 30, 35, 45, 50, 60, 75, 90, 120, 200]

categories.each do |category|
  category.recipes.create!(name: Faker::Pokemon.name, difficulty: difficulty.sample, prep_time: prep_time.sample, directions: Faker::Lorem.paragraph, creator: Faker::StarWars.character)
end

recipes = Recipe.all

recipes.each do |recipe|
  5.times do
    recipe.ingredients.create!(name: Faker::Food.ingredient)
  end
end
