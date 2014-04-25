class AddNickPass < ActiveRecord::Migration
  def change
	add_column :teachers, :login, :string
	add_column :teachers, :password, :digest 
  end
end
