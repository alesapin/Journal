class AddImgToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :img, :string
  end
end
