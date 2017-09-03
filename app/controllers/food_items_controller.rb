class FoodItemsController < ApplicationController
	
	def index
		@order_item = current_order.order_items.new
		if params[:pincode].present?
		  @locality = Locality.find_by_pincode(params[:pincode])
		  @food_items = @locality.food_items.includes(:time_slot) if @locality.present?
		  @morning = @food_items.where('time_slots.slot =?', "morning").references(:time_slot)
		  @afternoon = @food_items.where('time_slots.slot =?', "afternoon").references(:time_slot)
		  @evening = @food_items.where('time_slots.slot =?', "evening").references(:time_slot)
		  @night = @food_items.where('time_slots.slot =?', "night").references(:time_slot)
		else
			@food_items = FoodItem.includes(:time_slot)
		  @morning = @food_items.where('time_slots.slot =?', "morning").references(:time_slot)
		  @afternoon = @food_items.where('time_slots.slot =?', "afternoon").references(:time_slot)
		  @evening = @food_items.where('time_slots.slot =?', "evening").references(:time_slot)
		  @night = @food_items.where('time_slots.slot =?', "night").references(:time_slot)
		end
	end

	def show
		
	end

	private

	def food_items_params
		params.require(:food_items).permit!
	end

end
