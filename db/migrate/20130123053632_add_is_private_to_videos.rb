class AddIsPrivateToVideos < ActiveRecord::Migration
  def change
  add_column :videos, :is_private, :boolean, :default => false
  end
end
