class AddPasswordDigestToStudentsAndTeachers < ActiveRecord::Migration
  def change
    add_column :students, :password_digest, :text
    add_column :teachers, :password_digest, :text
  end
end
