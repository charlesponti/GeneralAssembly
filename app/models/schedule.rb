class Schedule < ActiveRecord::Base
  belongs_to :room
  belongs_to :course
  belongs_to :time_slot

  validates_presence_of :room_id, :course_id, :start_date, :end_date, :time_slot

  def get_times
    TimeSlot.find(self.time_slot_id).slotcode
  end

  def print_times
    "#{self.time_slot.start_time.strftime('%H:%M')} - #{self.time_slot.end_time.strftime('%H:%M')}"
  end

end
