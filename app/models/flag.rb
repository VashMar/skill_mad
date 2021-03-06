class Flag < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :video 
  belongs_to :user 

  attr_accessible :user_id, :video_id
  

  validates :video_id, presence: true 
  validates :user_id, presence: true


   def self.find_flag(user_id, video_id)
  where("user_id = ? AND video_id = ?", user_id, video_id)
  end

  
end
