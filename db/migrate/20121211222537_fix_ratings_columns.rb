class FixRatingsColumns < ActiveRecord::Migration
  def up
	remove_column :ratings, :worse
	rename_column :ratings, :better, :video
  end

  def down
	rename_column :ratings, :video, :better
	add_column :ratings, :worse, :integer
  end
end
