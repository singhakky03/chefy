class AddTimeSlotIdToFoodItems < ActiveRecord::Migration
  def change
    add_column :food_items, :time_slot_id, :integer
    remove_column :time_slots, :food_item_id, :integer
  end
end
