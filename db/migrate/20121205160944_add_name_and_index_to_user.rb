class AddNameAndIndexToUser < ActiveRecord::Migration
  def change
	
  end
  add_index :users, :email
end
