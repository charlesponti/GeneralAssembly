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
    self.courses.map(&:slotcodes).flatten
  end
  
  def booked? course
    self.courses.include? course
  end

  def update_balance operator,  how_much
    balance.send(operator, how_much)
    self
  end

  def add_course course
      self.courses << course
      self.update_balance(:+ , course_price).save
      course.update_seats_available
  end

  def can_add_course course
    errors.add(:courses, "you can't subscribe for that course")  unless self.current_schedule.length == (self.current_schedule - course.slotcodes).length
  end

end
