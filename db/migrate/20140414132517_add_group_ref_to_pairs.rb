class AddGroupRefToPairs < ActiveRecord::Migration
  def change
	add_reference :pairs, :group, index: true
  end
end
