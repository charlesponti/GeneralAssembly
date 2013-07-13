class RenameTimeSlotToTimeSlotIdInSchedules < ActiveRecord::Migration
  def change
    rename_column :schedules, :time_slot, :time_slot_id
  end
end
