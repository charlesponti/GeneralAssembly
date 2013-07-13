class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.date :dob
      t.string :address
      t.string :email
      t.string :student_image
      t.decimal :balance

      t.timestamps
    end
  end
end
