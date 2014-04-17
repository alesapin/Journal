class Student < ActiveRecord::Base	
	belongs_to :group
	has_many :misses
end
