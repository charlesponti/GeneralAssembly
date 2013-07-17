class RemoveRoomIdFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :room_id
  end
end
