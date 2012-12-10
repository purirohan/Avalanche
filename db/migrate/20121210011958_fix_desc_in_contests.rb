class FixDescInContests < ActiveRecord::Migration
	def up
		change_column :contests, :desc, :text
	end
	def down
		change_column :contests, :desc, :string
	end
end
