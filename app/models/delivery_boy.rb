class DeliveryBoy < ActiveRecord::Base
	has_many :orders
	belongs_to :locality
end
