class ParticipationsController < ApplicationController

	def new
		if !current_user
			redirect_to root_path
		end
		
		@contest = Contest.find(params[:contest_id])
		
		# can't apply to your own contest!
		if current_user.id == @contest.user_id
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
	
	def show #only for the creator of the contest to view
		@contest = Contest.find(params[:contest_id])
		if @contest.user_id != current_user
			redirect_to contest_rate_index_path(@contest)
		end
		@participation = Participation.find(params[:id])
		@submitter = User.find(@participation.user_id).name
		@video = embed_video(@participation)
	end

end
