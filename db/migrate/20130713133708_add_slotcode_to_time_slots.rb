class AddSlotcodeToTimeSlots < ActiveRecord::Migration
  def change
    add_column :time_slots, :slotcode, :string
  end
end
