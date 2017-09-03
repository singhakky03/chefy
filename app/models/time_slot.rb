class TimeSlot < ActiveRecord::Base
	
	validates :to, presence: true
	validates :from, presence: true
	has_many :food_items, :dependent => :delete_all

	TIME_SLOT = {morning: {from: "9AM", to: "12PM"}, afternoon: {from: "12PM", to: "4PM"}, evening: {from: "4PM", to: "7PM"}, night: {from: "7PM", to: "12AM"}}
end
