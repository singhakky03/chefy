class PaymentMethod < ActiveRecord::Base
	belongs_to :order

	PAY_TYPE = ["COD", "ONLINE", "WALLET"]
end
