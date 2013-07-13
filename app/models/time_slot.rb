class TimeSlot < ActiveRecord::Base
  has_many :schedules
  validates_presence_of :start_time, :end_time
end
