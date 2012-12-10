class UsersController < ApplicationController

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to root_path, :notice => "You have successfully registered for an account!"
		else
			render "new"
		end
	end
	
	def show
		@user = User.find(params[:id])
		@created = @user.contests.where("donor = ?", true)
		@participating = @user.contests.where("donor = ?", false)
		
	end
end
