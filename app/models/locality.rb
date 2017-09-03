class Locality < ActiveRecord::Base
	
	validates :name, presence: true
	validates :pincode, presence: true

	has_many :food_items, :dependent => :delete_all
	has_one :delivery_boy
end
