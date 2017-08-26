class FoodItemsController < ApplicationController
	
	def index
		@food_items = FoodItem.all
	end

	def show
		
	end

	private

	def food_items_params
		params.require(:food_items).permit!
	end

end
