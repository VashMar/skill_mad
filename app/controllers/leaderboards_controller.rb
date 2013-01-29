class LeaderboardsController < ApplicationController


def create 

end 


def video_board

if !params[:category] == nil

  @category = Category.find_by_category_name(params[:category])
  @videos = Video.find_in_cat(@category.id)
 else 
  @videos = Video.order("points DESC").limit(15)
 end 

 respond_to do |format|
  format.js{}
 end 
end

def people_board

@category = params[:category]
@leaderboard = params[:leaderboard] 



@user_list = User.order("points DESC").where(:hasVideo => true)

respond_to do |format|
 format.js{}
end 

end

end
