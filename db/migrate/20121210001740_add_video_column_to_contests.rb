class AddVideoColumnToContests < ActiveRecord::Migration
  def change
	add_column :contests, :video, :string
  end
end
