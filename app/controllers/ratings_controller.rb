class RatingsController < ApplicationController
	
	def index
		@contest = Contest.find(params[:contest_id])
		options = Participation.where("contest_id = ? AND user_id != ?", params[:contest_id], @contest.user_id)
		vid_index = rand(options.count)
		@vid = options[vid_index]
		@sub_id = @contest.id.to_s + "_" + @vid.id.to_s
		
		puts @sub_id
		puts "hi"
		
		respond_to do |format|  
			format.html { redirect_to contest_participation_path(params[:contest_id], @vid.id) }  
			format.js #index.js.erb 
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
		if Rating.where("contest_id = ? AND user_id = ? AND video = ?", rating.contest_id, rating.user_id, rating.video).blank?
			rating.save
		end
		redirect_to contest_ratings_path(params[:contest_id])
	end

end
