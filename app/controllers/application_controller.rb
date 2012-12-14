class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :embed_video
  
  # prevent back button from retaining cached sessions
  before_filter :set_cache_buster

  def set_cache_buster
    #response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    #response.headers["Pragma"] = "no-cache"
    #response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
  private
  
  def current_user
	# if we don't already have a @current_user, set it to the one specified by the session (if we have a session)
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
	def embed_video(videothing)
		if !videothing || !videothing.video
			"http://www.youtube.com/embed/oHg5SJYRHA0"
		else
			"http://www.youtube.com/embed/" + videothing.video.split("v=")[1].split("&")[0]
		end
	end
end
