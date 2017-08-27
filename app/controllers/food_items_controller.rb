class FoodItemsController < ApplicationController
	
	def index
		@food_items = FoodItem.includes(:time_slots)
		@food_items = @food_items.where(:time_slots => {:from => (Date.today.beginning_of_day-2), :to => (Date.today.end_of_day-2)})
	end

	def show
		
	end

	private

	def food_items_params
		params.require(:food_items).permit!
	end

end
