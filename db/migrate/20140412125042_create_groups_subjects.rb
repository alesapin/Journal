class CreateGroupsSubjects < ActiveRecord::Migration
  def change
    create_table :groups_subjects, :id => false do |t|
		t.belongs_to :group, :index => true
		t.belongs_to :subject, :index => true
    end
	
	remove_column :subjects, :teacher
  end
end
