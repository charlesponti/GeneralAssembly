class Room < ActiveRecord::Base
  has_many :schedules
  has_many :courses, through: :schedules
  has_many :time_slots, through: :schedules
  
  validates_presence_of :name
  
  def bookings
    self.time_slots.map { |x| x.slotcode }
  end

end
