class Participation < ActiveRecord::Base
	belongs_to :user
	belongs_to :contest
	attr_accessible :donor, :winner, :video
	
	def score		
		Rating.where("video = ?", self.id).count		
	end
	
	def submitter
		User.find(self.user_id).name
	end
	
end
