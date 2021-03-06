class AddVoteStatus < ActiveRecord::Migration
  def up
  add_column :votes, :voted_up, :boolean, :default => false
  add_column :votes, :voted_down, :boolean, :default => false 
  end

  def down
  remove_column :votes, :voted_up
  remove_column :votes, :voted_down
  end
end
