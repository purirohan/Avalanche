class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :Contest
      t.belongs_to :User
      t.integer :better
      t.integer :worse

      t.timestamps
    end
    add_index :ratings, :Contest_id
    add_index :ratings, :User_id
  end
end
