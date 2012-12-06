class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.belongs_to :user
      t.belongs_to :contest
      t.boolean :donor
      t.boolean :winner

      t.timestamps
    end
    add_index :participations, :user_id
    add_index :participations, :contest_id
  end
end
