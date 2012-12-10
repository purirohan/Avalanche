class RatingsController < ApplicationController

	def create
		rating = Rating.new
		rating.user_id = current_user.id
		rating.contest_id = params[:contest_id]
		rating.better = params[:better]
		rating.worse = params[:worse]
		if (Rating.where("contest_id = ? AND user_id = ? AND better = ? AND worse = ?", rating.contest_id, rating.user_id, rating.better, rating.worse).blank?)
			rating.save
		end
		redirect_to contest_rate_index_path(params[:contest_id])
	end

end
