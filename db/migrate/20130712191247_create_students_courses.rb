class CreateStudentsCourses < ActiveRecord::Migration
  def change
    create_table :students_courses do |t|
      t.integer :course_id
      t.integer :student_id

      t.timestamps
    end
    add_index :students_courses, :student_id
    add_index :students_courses, :course_id
  end
end
