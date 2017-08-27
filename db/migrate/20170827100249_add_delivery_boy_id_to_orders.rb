class AddDeliveryBoyIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_boy_id, :integer
  end
end
