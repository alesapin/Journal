class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :login
      t.string :password_digest
      t.string :name
      t.string :patronymic
      t.string :surname
      t.string :degree
    end
  end
end
