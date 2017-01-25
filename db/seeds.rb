User.destroy_all
Category.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

3.times do
  User.create!(name: "me", email: "me@gmail.com", password_digest: "123")
end

1.times do
  cat = Category.create!(name: "Appetizer")

  5.times do
    cat.recipes.create!(name: "Grits", difficulty: "Hard", prep_time: 10, directions: "Do stuff", creator: "me")

    c = cat.recipes.last

    5.times do
      c.ingredients.create!(name: "carrots")
    end
  end
end

