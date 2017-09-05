class Order < ActiveRecord::Base
  belongs_to :order_status
  belongs_to :delivery_boy
  has_many :order_items, :dependent => :delete_all
  belongs_to :address
  belongs_to :user
  has_one :payment_method

  after_create :set_order_status
  before_save :update_subtotal, :update_shipping, :update_tax, :update_total


  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def total
    subtotal + shipping + tax
  end

  def tax
    return 0
  end

  def shipping_charge
    charge = 0
    if subtotal < 100
      charge = 20
    end
    charge
  end

  def order_placed
    self.update_column('order_status_id', 3)
  end

  def delivery_boy
    delivery_boy_id = DeliveryBoy.pluck(:id).sample
    self.update_column('delivery_boy_id', delivery_boy_id)
  end

	private
	  def set_order_status
	    self.update_column('order_status_id', 1)
	  end

    def order_payment
      payment = self.payment_method.new
      payment.pay_type = PaymentMethod::PAY_TYPE[1]
      payment.paid_amount = self.total
      payment.save
    end

	  def update_subtotal
	    self[:subtotal] = subtotal
	  end

    def update_shipping
      self[:shipping] = shipping_charge
    end

    def update_tax
      self[:tax] = tax
    end

    def update_total
      self[:total] = total
    end

end
