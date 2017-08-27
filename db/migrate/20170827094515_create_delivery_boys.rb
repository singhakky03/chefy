class CreateDeliveryBoys < ActiveRecord::Migration
  def change
    create_table :delivery_boys do |t|
      t.string :name
      t.string :contact

      t.timestamps null: false
    end
  end
end
