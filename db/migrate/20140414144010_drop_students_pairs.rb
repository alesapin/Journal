class DropStudentsPairs < ActiveRecord::Migration
  def change
	drop_table :pairs_students
  end
end
