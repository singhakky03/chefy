class TimeSlot < ActiveRecord::Base
	has_many :food_item_time_slots
	has_many :food_items, through: :food_item_time_slots 
end
