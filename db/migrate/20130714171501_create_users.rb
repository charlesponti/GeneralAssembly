class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date :dob
      t.string :address
      t.text :bio
      t.string :user_image
      t.string :username
      t.decimal :balance
      t.string :role
      t.text :password_digest

      t.timestamps
    end
  end
end
