class CheckoutController < ApplicationController
  
  before_action :authenticate_user!, only: [:index]
  
  def index
  	@order = current_order
  	@addresses = current_user.addresses
  	@order.update_column('user_id', current_user.id) unless @order.user_id.present?
  end

  def place_order
  	if session[:order_id].present?
	  	@order = current_order
	  	@order.order_placed
	  	@order.delivery_boy
      @order.order_payment
	  	session.delete(:order_id)
  	else
  		@order = current_user.orders.last
  	end
  end

  

end
