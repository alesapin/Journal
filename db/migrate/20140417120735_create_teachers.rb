class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :academic_degree
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end
