class RemoveGroupFromStudent < ActiveRecord::Migration
  def change
	remove_column :students, :groups
  end
end
