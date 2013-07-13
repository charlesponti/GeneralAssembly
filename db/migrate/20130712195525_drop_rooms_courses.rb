class DropRoomsCourses < ActiveRecord::Migration
  def change
    drop_table :rooms_courses
  end
end
