class FoodItem < ActiveRecord::Base
	has_many :time_slots
end
