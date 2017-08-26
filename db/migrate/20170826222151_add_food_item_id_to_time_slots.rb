class AddFoodItemIdToTimeSlots < ActiveRecord::Migration
  def change
  	add_column :time_slots, :food_item_id, :integer
    add_index  :time_slots, :food_item_id
  end
end
