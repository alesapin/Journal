class Pair < ActiveRecord::Base
	belongs_to :subject
	belongs_to :group
	has_many :misses
end
