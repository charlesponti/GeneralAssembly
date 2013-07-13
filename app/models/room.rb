class Room < ActiveRecord::Base
  has_many :schedules
  #has_one :course
  has_many :courses, through: :schedules
  
  validates_presence_of :name
  
  def bookings
    r.schedules.map { |x| x.get_times }
  end
end
