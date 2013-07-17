class User < ActiveRecord::Base 
  has_secure_password

  has_many :students_courses
  has_many :courses, through: :students_courses
  
  scope :admins, -> { where(role: 'admin') }
  scope :teachers, -> { where(role: 'teacher') }
  scope :students, -> { where(role: 'student') }

  validates_presence_of :name, :email, :address, :bio, :username
  
  def teaching
    Course.where(teacher_id: self.id)
  end
  
  def current_schedule
    self.courses.map(&:slotcodes).flatten
  end
  
  def booked? course
    self.courses.include? course ? true : false
  end

  def add_course course
    compare = (self.current_schedule - course.slotcodes).length
    if self.current_schedule.length == compare
      self.courses << course
      self.balance += course.price
      self.save
      course.seats -= 1
      course.save
    else
      false
    end
  end

end
