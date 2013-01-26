class CreateLeaderboards < ActiveRecord::Migration
  def up
   create_table :leaderboards do |t|
   t.string    :leaderboard_name
   t.string    :leaderboard_rules 
   t.string    :leaderboard_type 
   t.text      :leaderboard_description
   t.timestamps
   end
  end  

  def down
  end
end
