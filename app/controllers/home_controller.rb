class HomeController < ApplicationController
  def index
	@user = User.new
	@featured = Contest.first
	@featured_video = embed_video(@featured)
	@featured_text = @featured.desc_preview(232)
  end
  
  def about
  end
 
end
