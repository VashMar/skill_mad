class Category < ActiveRecord::Base
 
 
 has_many :videos 
 has_many :leaderboards 
 has_many :users, :through => :videos  
 attr_accessible :category_name, :rank 

 validates :category_name, :presence => true, :uniqueness => {:case_sensitive=> false} 




end
