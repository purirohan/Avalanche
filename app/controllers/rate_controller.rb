class RateController < ApplicationController

	def index
		@contest = Contest.find(params[:contest_id])
		options = Participation.where("contest_id = ? AND user_id != ?", params[:contest_id], @contest.user_id)
		first_vid_index = rand(options.count)
		second_vid_index = rand(options.count)
		while second_vid_index == first_vid_index
			second_vid_index = rand(options.count)
		end
		@first_vid = options[first_vid_index]
		@second_vid = options[second_vid_index]
		@first_vid_embed = embed_video(@first_vid)
		@second_vid_embed = embed_video(@second_vid)
	end

end
