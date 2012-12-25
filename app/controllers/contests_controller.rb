class ContestsController < ApplicationController

	def index
		@contests = Contest.all
	end

	def new
		@contest = Contest.new
		if !current_user
			redirect_to log_in_path
		end
	end
	
	def create
		if !current_user
			redirect_to log_in_path
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
		@contest = Contest.find(params[:id])
		@is_owner = @contest.contest_owner?(current_user)
		@has_submitted = @contest.submitted?(current_user)
		if @has_submitted
			@curr_user_submission = Participation.where("contest_id = ? AND user_id = ?", params[:id], current_user.id)[0]
		end
		@owner = User.find(@contest.user_id).name
		@video = embed_video(@contest)
		
		@submissions = @contest.submissions
		
	end
	
	def edit
		@contest = Contest.find(params[:id])
		if @contest.contest_owner?(current_user) == false
			redirect_to @contest
		end
	end
	
	def update
		contest = Contest.find(params[:id])
		if contest.contest_owner?(current_user) == false
			redirect_to contest
		end
		contest.update_attributes(params[:contest]) 
		redirect_to contest
	end
	
	def destroy
		contest = Contest.find(params[:id])
		if contest.contest_owner?(current_user) == false
			redirect_to contest
		end
		contest.delete
		redirect_to current_user
	end

end
