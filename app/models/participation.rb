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
	
	def submitted?(contest_id)
		Participation.where("contest_id = ? AND user_id = ?", contest_id, current_user.id).blank? == false
	end
	
end
