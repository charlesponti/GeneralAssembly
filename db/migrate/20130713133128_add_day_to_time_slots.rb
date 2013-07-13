class AddDayToTimeSlots < ActiveRecord::Migration
  def change
    add_column :time_slots, :day, :string
  end
end
