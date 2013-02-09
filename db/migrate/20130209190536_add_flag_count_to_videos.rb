class AddFlagCountToVideos < ActiveRecord::Migration
  def change
  add_column :videos, :flag_count, :integer, :null => false, :default => 0
end
end
