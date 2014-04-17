class CreateSubjectsTeachers < ActiveRecord::Migration
  def change
    create_table :subjects_teachers,:id => false do |t|
		t.integer :subject_id
		t.integer :teacher_id
    end
	
	add_index :subjects_teachers, :subject_id
	add_index :subjects_teachers, :teacher_id
	
	remove_column :subjects, :teacher
  end
end
