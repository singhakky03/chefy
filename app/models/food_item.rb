class FoodItem < ActiveRecord::Base
	
	belongs_to :locality
	belongs_to :time_slot
	has_many :order_items, :dependent => :delete_all

    #default_scope { where(status: true) }
end
