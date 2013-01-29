class AddLeaderboardIdToVideo < ActiveRecord::Migration
  def change
  add_column :videos, :leaderboard_id, :integer 
  end
end
