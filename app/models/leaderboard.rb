class Leaderboard < ActiveRecord::Base 

 belongs_to :category 
 has_many :videos
 has_many :users 
 attr_accessible :leaderboard_name, :leaderboard_type, :leaderboard_description, :leaderboard_rules  


 validates :leaderboard_name, :presence => true, :uniqueness => {:case_sensitive=> false}, :length => {:maximum => 100} 
 validates :leaderboard_description, :presence => true
 


  
 



end
