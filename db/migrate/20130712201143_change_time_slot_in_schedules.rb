class ChangeTimeSlotInSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :time_slot
    add_column :schedules, :time_slot, :integer
  end
end
