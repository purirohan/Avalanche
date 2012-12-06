class HomeController < ApplicationController
  def index
	if current_user
		redirect_to current_user
	end
	@user = User.new
  end
  
  def about
  end
 
end
