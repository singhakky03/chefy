class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.datetime :from
      t.datetime :to

      t.timestamps null: false
    end
  end
end
