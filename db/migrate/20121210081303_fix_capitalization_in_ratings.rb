class FixCapitalizationInRatings < ActiveRecord::Migration

	def change
		rename_column :ratings, :User_id, :user_id
		rename_column :ratings, :Contest_id, :contest_id
	end

end
