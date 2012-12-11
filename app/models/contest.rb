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
end
