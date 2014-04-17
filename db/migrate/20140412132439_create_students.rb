class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.belongs_to :group, index: true

      t.timestamps
    end
  end
end
