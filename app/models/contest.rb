class Contest < ActiveRecord::Base
	has_many :users, :through => :participations
	has_many :participations
	attr_accessible :category, :desc, :ending, :name, :video
end
