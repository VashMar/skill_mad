class AddPointsToVideos < ActiveRecord::Migration
def change
  add_column :videos, :points, :integer, :null => false, :default => 0
end
end
