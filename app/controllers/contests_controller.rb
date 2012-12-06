class ContestsController < ApplicationController

	def new
		@contest = Contest.new
	end
	
	def create
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
		@owner = current_user.id == @contest.user_id
	end

end
