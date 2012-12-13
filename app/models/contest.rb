class Contest < ActiveRecord::Base
	has_many :users, :through => :participations
	has_many :participations
	has_many :ratings
	attr_accessible :category, :desc, :ending, :name, :video
	
	def desc_preview(len)
		if self.desc.length < len
			self.desc
		else
			self.desc[0, len - 1] + "... "
		end
	end
	
	def contest_owner?
		!current_user || current_user.id != self.user_id
	end
	
	def submissions
		Participation.where("contest_id = ? AND user_id != ?", self, self.user_id)
	end
	
end
