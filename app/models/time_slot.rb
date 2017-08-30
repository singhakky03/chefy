class TimeSlot < ActiveRecord::Base
	belongs_to :food_item

	TIMESLOT = {morning: {from: "9AM", to: "12PM"}, afternoon: {from: "12PM", to: "4PM"}, evening: {from: "4PM", to: "7PM"}, night: {from: "7PM", to: "12AM"}}
end
