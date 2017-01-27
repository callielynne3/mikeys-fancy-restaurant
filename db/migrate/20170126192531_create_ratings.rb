class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :rate, null: :false
      t.references :user, null: :false
      t.references :recipe, null: :false

      t.timestamps
    end
  end
end
