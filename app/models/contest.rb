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
	
	def contest_owner?(user)
		if user == nil
			false
		else
			user.id == self.user_id
		end
	end
	
	def all_submissions
		Participation.where("contest_id = ? AND user_id != ?", self, self.user_id).sort! { |p1,p2| p1.sort_by_score(p2) }
	end
	
	def submitted?(user)
		if user == nil
			false
		else
			Participation.where("contest_id = ? AND user_id = ?", self, user.id).blank? == false
		end
	end
	
	def curr_user_submission(user)
		Participation.where("contest_id = ? AND user_id = ?", self, user.id)[0]	
	end
	
	def delete
		Participation.where("contest_id = ?", self).each do |p|
			p.delete
		end
		self.destroy
	end
	
end
