class Participation < ActiveRecord::Base
	belongs_to :user
	belongs_to :contest
	attr_accessible :donor, :winner, :video
	
	def score		
		(Rating.where("better = ?", self.id).count * 3) - Rating.where("worse = ?", self.id).count		
	end
	
	def submitter
		User.find(self.user_id).name
	end
	
end
