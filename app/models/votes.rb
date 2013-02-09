class Votes < ActiveRecord::Base

  belongs_to :user
  belongs_to :video 
  
  attr_accessible :voted_down, :voted_up, :video_id, :user_id


  validates :video_id, presence: true 
  validates :user_id, presence: true

  def self.find_vote(user_id, video_id)
  where("user_id = ? AND video_id = ?", user_id, video_id)
  end

 
 
  

   
end
