class Group < ActiveRecord::Base
	has_many :students
	has_many :pairs
	has_and_belongs_to_many :subjects
end
