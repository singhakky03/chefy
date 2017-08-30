class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address_type
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :pincode
      t.string :state

      t.timestamps null: false
    end
  end
end
