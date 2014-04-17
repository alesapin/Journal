class CreatePairsStudents < ActiveRecord::Migration
  def change
    create_table :pairs_students, :id => false do |t|
		t.integer :student_id
		t.integer :pair_id
		t.integer :miss
    end
	
	add_index :pairs_students, :student_id
	add_index :pairs_students, :pair_id
  end
end
