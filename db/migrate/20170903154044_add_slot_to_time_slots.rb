class AddSlotToTimeSlots < ActiveRecord::Migration
  def change
    add_column :time_slots, :slot, :string
  end
end
