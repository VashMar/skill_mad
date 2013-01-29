class Category < ActiveRecord::Base
 
 
 has_many :videos 
 has_many :leaderboards 
 has_many :users 
 attr_accessible :category_name 

 validates :category_name, :presence => true, :uniqueness => {:case_sensitive=> false} 




end
