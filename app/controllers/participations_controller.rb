class ParticipationsController < ApplicationController

	def new
		
		@contest = Contest.find(params[:contest_id])
		
		if !current_user
			redirect_to log_in_path
		end
		
		# can't apply to your own contest!
		if @contest.contest_owner?(current_user) == true
			redirect_to @contest
		end
		
		@participation = Participation.new
		
	end
	
	def create
		participation = Participation.new(params[:participation])
		participation.contest_id = params[:contest_id]
		participation.user_id = current_user.id
		participation.donor = false
		participation.winner = false
		participation.save
		redirect_to contest_path(params[:contest_id])
	end
	
	def destroy
		participation = Participation.find(params[:id])
		participation.destroy
		redirect_to Contest.find(params[:contest_id])
	end
	
	def show 
		@contest = Contest.find(params[:contest_id])
		@participation = Participation.find(params[:id])
		@submitter = User.find(@participation.user_id).name
		@video = embed_video(@participation)
	end

end
