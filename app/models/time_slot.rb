class TimeSlot < ActiveRecord::Base
  has_many :schedules
  validates_presence_of :start_time, :end_time

  def print_times
    "#{self.start_time.strftime('%l:%M')} - #{self.end_time.strftime('%l:%M')}"
  end

  def day_and_time
    "#{self.day} :#{self.print_times}"
  end

end
