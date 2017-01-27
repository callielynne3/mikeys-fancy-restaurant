class AddUserToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :user
  end
end
