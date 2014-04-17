class DeleteBadTable < ActiveRecord::Migration
  def change
	drop_table :subject_and_groups
	drop_table :misses
  end
end
