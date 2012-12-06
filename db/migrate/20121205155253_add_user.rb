class AddUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :pwh
      t.string :pws

      t.timestamps
    end
  end
end
