class Student < ActiveRecord::Base
  has_secure_password

  has_many :students_courses
  has_many :courses, through: :students_courses

  validates_presence_of :name, :address, :email
  
  def current_schedule
    self.courses.map do |x| 
      x.schedules.map do |i|
        i.get_times.slotcode 
      end
    end
  end
  
  def booked? course
    self.courses.include? course
  end

  def add_course course
    c = course
    if !(booked? c) && (self.current_schedule - c.time_slots).empty? && !(c.full?)
      self.course << c
      self.balance += c.price
    end
    c.seats -= 1
    c.save
  end
end
