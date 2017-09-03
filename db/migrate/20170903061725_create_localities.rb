class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.string :pincode
      t.string :name

      t.timestamps null: false
    end
  end
end
