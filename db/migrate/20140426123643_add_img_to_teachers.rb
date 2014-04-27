class AddImgToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :img, :string
  end
end
