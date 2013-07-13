class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :room_id
      t.integer :course_id
      t.date :start_date
      t.date :end_date
      t.time :time_slot
      
      t.timestamps
    end
  end
end
