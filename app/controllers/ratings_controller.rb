class RatingsController < ApplicationController
	
	def index
		@contest = Contest.find(params[:contest_id])
		options = @contest.all_submissions
		vid_index = rand(options.count)
		@vid = options[vid_index]
		@sub_id = @contest.id.to_s + "_" + @vid.id.to_s
		@has_voted = Participation.find(@vid.id).voted?(current_user)
		
		respond_to do |format|  
			format.html { redirect_to contest_participation_path(params[:contest_id], @vid.id) }  
			format.js # views/ratings/index.js.erb by default
		end  
	end

	def create
		if !current_user
			redirect_to log_in_path
		end
		rating = Rating.new
		rating.user_id = current_user.id
		rating.contest_id = params[:contest_id]
		rating.video = params[:video]
		participation = Participation.find(rating.video)
		if participation.voted?(current_user) == false
			rating.save
		end
		respond_to do |format|
			format.html { redirect_to contest_ratings_path(params[:contest_id]) }
		end
	end

end
