class AddHasVideoTo < ActiveRecord::Migration
  def change
  add_column :users, :hasVideo, :boolean, :default => false  
  end
end
