class AddressesController < ApplicationController

	before_action :authenticate_user!
  
  def new
		@address = Address.new
	end

	def create
		@address = Address.new(address_params)
		if @address.save
    	redirect_to checkout_index_path
	  else
	    render 'new'
	  end
	end

	private

	def address_params
		params.require(:address).permit!
	end

	def address_present
		redirect_to checkout_index_path if current_user.addresses.count > 0
	end
end
