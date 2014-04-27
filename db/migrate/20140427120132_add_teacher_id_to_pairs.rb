class AddTeacherIdToPairs < ActiveRecord::Migration
  def change
    add_column :pairs, :teacher_id, :integer
  end
end
