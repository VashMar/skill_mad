class LeaderboardsController < ApplicationController


def create 

end 


def video_board

if params[:leaderboard] == "All Leaderboards"
   if params[:category] == "All Categories"
       @videos = Video.order("points DESC").limit(15)
   else 
        @cat = Category.find_by_category_name(params[:category])
        @videos = Video.find_in_cat(@cat.id).order("points DESC")
   end
else 
    @leaders = Leaderboard.find_by_leaderboard_name(params[:leaderboard])
    @videos = @leaders.videos.order("points DESC")
end

  respond_to do |format|
   format.js{}
  end 
end

def people_board

@category = params[:category]
@leaderboard = params[:leaderboard] 

if @leaderboard == "All Leaderboards" 
   if @category == "All Categories"
      @user_list = User.order("points DESC").where(:hasVideo => true)
   else 
         
   end



respond_to do |format|
 format.js{}
end 

end

end
