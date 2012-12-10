class HomeController < ApplicationController
  def index
	@user = User.new
	@featured = Contest.first
	@featured_video = embed_video(@featured)
	@trending1 = Contest.last
	@trending2 = Contest.find(2)
	@trending1_video = embed_video(@trending1)
	@trending2_video = embed_video(@trending2)
  end
  
  def about
  end
 
end
