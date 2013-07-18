class Course < ActiveRecord::Base
  belongs_to :teacher, class_name: 'User'

  has_many :students_courses
  has_many :users, through: :students_courses
  
  has_many :schedules
  has_many :rooms, through: :schedules
  has_many :time_slots, through: :schedules
  
  validates :name, presence: true, uniqueness: true
  validates_presence_of :description, :price

  accepts_nested_attributes_for :schedules, allow_destroy: true

  mount_uploader :course_image, CourseImageUploader
  
  def students
    self.users
  end
  
  def times_on day # Returns array of TimeSlot objects on specified day of week
    self.time_slots.where(day: day)
  end

  def slotcodes # Returns array of TimeSlot slotcodes for course
    self.schedules.map(&:slotcode)
  end

  def remove_seats seats
    seats -= 1
    self.save
  end

  def add_seats seats
    seats += 1
    self.save
  end

  def full?
    self.seats == 0
  end

end
