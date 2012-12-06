class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.authenticate(params[:email], params[:password])
		if user
			session[:user_id] = user.id
			redirect_to user_path(user.id), :notice => "Your login was successful."
		else
			flash.now.alert = "Invalid email or password."
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		reset_session
		redirect_to root_path, :notice => "You have been successfully logged out."
	end

end
