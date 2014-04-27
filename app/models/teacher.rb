class Teacher < ActiveRecord::Base
	validates :login, presence: true, uniqueness: true
	has_secure_password
	has_and_belongs_to_many :subjects
	has_many :pairs
end
