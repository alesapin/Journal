class AddOthc < ActiveRecord::Migration
  def change
	add_column :teachers, :patronymic ,:string
  end
end
