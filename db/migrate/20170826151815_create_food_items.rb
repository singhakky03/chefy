class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :chef
      t.integer :rating

      t.timestamps null: false
    end
  end
end
