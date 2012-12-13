class HomeController < ApplicationController
  def index
	@user = User.new
	@featured = Contest.first
	@featured_video = embed_video(@featured)
	@featured_text = @featured.desc_preview(180)
	
	subs = @featured.submissions
	@sub1 = subs[0]
	@sub2 = subs[1]
	@sub3 = subs[2]
	
  end
  
  def about
  end
 
end
