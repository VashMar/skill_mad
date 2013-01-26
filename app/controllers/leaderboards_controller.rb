class LeaderboardsController < ApplicationController


def create 


end 

def video_board

respond_to do |format|
 format.js{}
end 

end

def people_board

@user_list = User.order("points DESC").where(:hasVideo => true)

respond_to do |format|
 format.js{}
end 

end

end
