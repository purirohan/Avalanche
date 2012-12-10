class FixEndingInContests < ActiveRecord::Migration
	
	def up
		change_column :contests, :ending, :string
	end
	def down
		change_column :contests, :ending, :datetime
	end
end
