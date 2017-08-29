class OrderItem < ActiveRecord::Base
  belongs_to :food_item
  belongs_to :order

	validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validate :food_item_present
	validate :order_present

	before_save :finalize
	after_save :update_order

	def update_order
		self.order.save
	end

	def unit_price
	  if persisted?
	    self[:unit_price]
	  else
	    food_item.price
	  end
	end

	def total_price
	  unit_price * quantity
	end

	private
	def food_item_present
	  if food_item.nil?
	    errors.add(:food_item, "is not valid or is not active.")
	  end
	end

	def order_present
	  if order.nil?
	    errors.add(:order, "is not a valid order.")
	  end
	end

	def finalize
	  self[:unit_price] = unit_price
	  self[:total_price] = quantity * self[:unit_price]
	end

end