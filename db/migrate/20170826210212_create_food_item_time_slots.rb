class CreateFoodItemTimeSlots < ActiveRecord::Migration
  def change
    create_table :food_item_time_slots do |t|
      t.integer :food_item_id
      t.integer :time_slot_id

      t.timestamps null: false
    end
  end
end
