class CreateRoomsCourses < ActiveRecord::Migration
  def change
    create_table :rooms_courses do |t|
      t.integer :room_id
      t.integer :course_id
      t.date :start_date
      t.date :end_date
      t.time :time_slot

      t.timestamps
    end
    add_index :rooms_courses, :room_id
    add_index :rooms_courses, :course_id
  end
end
