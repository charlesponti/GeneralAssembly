class User < ActiveRecord::Base 
  has_secure_password

  has_many :students_courses
  has_many :courses, through: :students_courses
  
  scope :admins, -> { where(role: 'admin') }
  scope :teachers, -> { where(role: 'teacher') }
  scope :students, -> { where(role: 'student') }

  validates_presence_of :name, :email, :address, :bio, :username

  mount_uploader :user_image, UserImageUploader
  
  def teaching
    Course.where(teacher_id: self.id)
  end

  def current_schedule
    case self.role
      when 'teacher' then TimeSlot.joins(:schedules).where('schedules.course_id in (?)', self.teaching.map(&:id)).map(&:slotcode)
      else TimeSlot.joins(:schedules).where('schedules.course_id in (?)', self.courses.map(&:id)).map(&:slotcode)
    end
  end
  
  def booked? course
    self.courses.include? course
  end

  def update_balance operator, how_much
    self.balance = case operator
      when 'add' then self.balance += how_much
      when 'subtract' then self.balance -= how_much
    end
    self
  end
  
  def add_course course
      self.courses << course
      self.update_balance('add', course.price).save
      course.remove_seats 1
  end

  def drop_course course
      self.courses.delete course
      self.update_balance('subtract', course.price).save
      course.add_seats 1
  end

  def can_add_course course
    if !(self.current_schedule.length == (self.current_schedule - course.slotcodes).length)
      errors.add(:courses, "you can't subscribe for that course")
    else
      true
    end
  end

end
