class ContestsController < ApplicationController

	def index
		@contests = Contest.all
	end

	def new
		@contest = Contest.new
	end
	
	def create
		if !current_user
			redirect_to root_path
		end
		contest = Contest.new(params[:contest])
		contest.user_id = current_user.id
		contest.save
		participation = Participation.new
		participation.contest_id = contest.id
		participation.user_id = current_user.id
		participation.donor = true
		participation.winner = false
		participation.save
		redirect_to contest
	end
	
	def show
		if !current_user
			redirect_to root_path
		end
		@contest = Contest.find(params[:id])
		@isOwner = current_user != nil && current_user.id == @contest.user_id
		@has_submitted = Participation.where("contest_id = ? AND user_id = ?", params[:id], current_user.id).blank? == false
		if @has_submitted
			@curr_user_submission = Participation.where("contest_id = ? AND user_id = ?", params[:id], current_user.id)[0]
		end
		@owner = User.find(@contest.user_id).name
		@video = embed_video(@contest)
		
		@submissions = Participation.where("contest_id = ? AND user_id != ?", params[:id], @contest.user_id)
		
	end
	
	def edit
		@contest = Contest.find(params[:id])
		# make sure the owner is the only one accessing this puppy.
		if !current_user || current_user.id != @contest.user_id
			redirect_to root_path
		end
	end
	
	def update
		contest = Contest.find(params[:id])
		if !current_user || current_user.id != contest.user_id
			redirect_to root_path
		end
		contest.update_attributes(params[:contest]) 
		redirect_to contest
	end
	
	def destroy
		contest = Contest.find(params[:id])
		if !current_user || current_user.id != contest.user_id
			redirect_to root_path
		end
		contest.destroy
		redirect_to current_user
	end

end
