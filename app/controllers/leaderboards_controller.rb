class LeaderboardsController < ApplicationController


def create 


end 

def video_board

if !params[:category] == nil
@category = Category.find_by_category_name(params[:category])
@cat_videos = Video.find_in_cat(@category.id)
else 
@cat_videos = Video.order("points DESC").limit(15)
end 




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
