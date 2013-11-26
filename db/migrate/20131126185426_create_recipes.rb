class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.text :ingredients
      t.text :instructions
      t.integer :user_id

      t.timestamps
    end
  end
end
