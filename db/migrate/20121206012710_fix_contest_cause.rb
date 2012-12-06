class FixContestCause < ActiveRecord::Migration
	def change
		rename_column :contests, :cause, :category
	end
end
