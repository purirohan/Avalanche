class RatingsController < ApplicationController
	
	def index
		@contest = Contest.find(params[:contest_id])
		options = Participation.where("contest_id = ? AND user_id != ?", params[:contest_id], @contest.user_id)
		vid_index = rand(options.count)
		@vid = options[vid_index]
		
		#if they've already voted on all the videos in this contest, we simply bring them back to the contest's page.
		#if Rating.where("contest_id = ? AND user_id = ?", @contest.id, current_user.id).count == Participation.where("contest_id = ? AND donor = ?", @contest.id, false).count
		#	redirect_to contest_path(@contest)
		#end
		
		#find a video that they haven't voted on yet.
		#while Rating.where("contest_id = ? AND user_id = ? AND video = ?", @contest.id, current_user.id, @vid.id).blank? == false
		#	vid_index = rand(options.count)
		#	@vid = options[vid_index]
		#end
		
		redirect_to contest_participation_path(params[:contest_id], @vid.id)
	end

	def create
		rating = Rating.new
		rating.user_id = current_user.id
		rating.contest_id = params[:contest_id]
		rating.video = params[:video]
		if Rating.where("contest_id = ? AND user_id = ? AND video = ?", rating.contest_id, rating.user_id, rating.video).blank?
			rating.save
		end
		redirect_to contest_ratings_path(params[:contest_id])
	end

end
