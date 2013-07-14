class Course < ActiveRecord::Base
  has_many :students_courses
  has_many :students, through: :students_courses
  
  belongs_to :teacher
  
  has_many :schedules
  belongs_to :room
  
  validates :name, presence: true, uniqueness: true
  validates_presence_of :description, :price
  
  def times # Returns array of TimeSlot objects
    self.schedules.map { |x| x.time_slot }
  end
  
  def times_on day # Returns array of TimeSlot objects on specified day of week
    self.times.reject { |x| !(x.day == day )}
  end

  def slotcodes # Returns array of all TimeSlot slotcodes
    self.schedules.map { |x| x.get_times }
  end

  def full?
    self.seats == 0
  end

  def set_schedule room, start_date, end_date, time_slot_id
    Schedule.create(room_id: room, course_id: self.id, start_date: "2013-06-15", 
      end_date:"2013-09-15", time_slot_id: 2)
  end

end
