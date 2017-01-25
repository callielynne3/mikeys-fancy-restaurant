class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name 
      t.string :difficulty
      t.integer :prep_time
      t.text :directions
      t.string :creator
      t.references :category

      t.timestamps
    end
  end
end
