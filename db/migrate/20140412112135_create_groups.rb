class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :course
      t.integer :number_of_students

      t.timestamps
    end
  end
end
