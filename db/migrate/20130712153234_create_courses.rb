class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :teacher_id
      t.string :course_image

      t.timestamps
    end
  end
end
