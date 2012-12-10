class AddUserInfo < ActiveRecord::Migration
  def up
 
  add_column :users, :major, :string
  add_column :users, :year, :string
  add_column :users, :skill, :string 
  add_column :users, :about, :text 
  end

  def down
  drop_column :users, :major, :string
  drop_column :users, :year, :string
  drop_column :users, :skill, :string 
  drop_column :users, :about, :text, :limit => 250
  end
end
