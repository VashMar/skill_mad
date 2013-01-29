class AddCategoryIdToLeaderboard < ActiveRecord::Migration
  def change
   add_column :leaderboards, :category_id, :integer 
  end
end
