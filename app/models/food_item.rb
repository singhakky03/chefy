class FoodItem < ActiveRecord::Base
	has_many :food_item_time_slots
	has_many :time_slots, through: :food_item_time_slots
end
