class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.string :desc
      t.datetime :ending
      t.belongs_to :user
      t.string :cause

      t.timestamps
    end
    add_index :contests, :user_id
  end
end
