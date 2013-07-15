class Course < ActiveRecord::Base
  belongs_to :teacher, class_name: 'User'
  belongs_to :room

  has_many :students_courses
  #has_many :students, through: :students_courses

  has_many :users, through: :students_courses, class_name: 'User'
  
  has_many :schedules
  has_many :time_slots, through: :schedules
  
  validates :name, presence: true, uniqueness: true
  validates_presence_of :description, :price

  accepts_nested_attributes_for :schedules, allow_destroy: true
  
  def times_on day # Returns array of TimeSlot objects on specified day of week
    self.time_slots.reject { |x| !(x.day == day )}
  end

  def slotcodes # Returns array of TimeSlot slotcodes for course
    self.schedules.map { |x| x.slotcode }
  end

  def full?
    self.seats == 0
  end

  def set_schedule room, start_date, end_date, time_slot_id
    Schedule.create(room_id: room, course_id: self.id, start_date: "2013-06-15", 
      end_date:"2013-09-15", time_slot_id: 2)
  end

end
