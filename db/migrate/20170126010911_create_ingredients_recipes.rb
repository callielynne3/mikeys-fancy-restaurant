class CreateIngredientsRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients_recipes do |t|
      t.references :recipe
      t.references :ingredient

      t.timestamps
    end
  end
end
