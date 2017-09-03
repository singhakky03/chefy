class AddLocalityIdToFoodItems < ActiveRecord::Migration
  def change
    add_column :food_items, :locality_id, :integer
  end
end
