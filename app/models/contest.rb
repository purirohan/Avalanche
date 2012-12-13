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
		if @current_user == nil
			false
		else
			@current_user.id == self.user_id
		end
	end
	
	def submissions
		Participation.where("contest_id = ? AND user_id != ?", self, self.user_id)
	end
	
	def submitted?
		if !@current_user
			false
		else
			Participation.where("contest_id = ? AND user_id = ?", self, @current_user.id).blank? == false
		end
	end
	
end
