class FoodItemTimeSlot < ActiveRecord::Base
	belongs_to :food_item
	belongs_to :timeslot	
end
