class TimeSlot < ActiveRecord::Base
	belongs_to :food_item

	TIMESLOT = ["9AM-12PM", "12PM-3PM", "3PM-6PM", "6PM-9PM"]
end
