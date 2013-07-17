class AddUserIdToStudentsCourses < ActiveRecord::Migration
  def change
    add_column :students_courses, :user_id, :integer
  end
end
