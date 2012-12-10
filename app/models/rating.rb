class Rating < ActiveRecord::Base
  belongs_to :contest
  belongs_to :user
  attr_accessible :user_id, :contest_id, :better, :worse
end
