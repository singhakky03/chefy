class CheckoutController < ApplicationController
  
  before_action :authenticate_user!, only: [:index]
  
  def index
  	@order = current_order
  	@addresses = current_user.addresses
  end

  def place_order
  	
  end

  

end
