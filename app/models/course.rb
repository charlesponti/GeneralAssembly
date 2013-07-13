class Course < ActiveRecord::Base
  has_many :students_courses
  has_many :students, through: :students_courses
  
  has_one :teacher
  
  has_many :schedules
  belongs_to :room
  
  validates :name, presence: true, uniqueness: true
  validates_presence_of :description, :price

  def get_teacher
    Teacher.find(self.teacher_id)
  end

  def schedule
    Schedule.find_by(course_id: self.id)
  end

  def time_slots
    self.schedules.map { |x| x.get_times.slotcode }
  end

  def days
    self.schedules.map { |x| x.get_times.day }
  end

  def full?
    self.seats == 0
  end

end
