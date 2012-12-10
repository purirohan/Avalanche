class AddColumnsToParticipation < ActiveRecord::Migration
	def change
		add_column :participations, :video, :string
	end
end
