class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :pay_type
      t.decimal :paid_amount
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
