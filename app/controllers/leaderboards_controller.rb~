class LeaderboardsController < ApplicationController


def create 

end 


def video_board


@category = params[:category]
@leaderboard = params[:leaderboard] 
 
if @leaderboard == "All Leaderboards" || @leaderboard == nil
   if params[:category] == "All Categories"
       @videos = Video.order("points DESC").limit(15)
   else 
        @cat = Category.find_by_category_name(params[:category])
        @videos = Video.find_in_cat(@cat.id).order("points DESC")
   end
else 
    @leaders = Leaderboard.find_by_leaderboard_name(params[:leaderboard])
    @videos =  Video.find_in_lb(@leaders.id)
end

  respond_to do |format|
    format.js{}
  end 

end

def people_board

@category = params[:category]
@leaderboard = params[:leaderboard] 

if @leaderboard == "All Leaderboards" || @leaderboard == nil
   if @category == "All Categories"
      @user_list = User.order("points DESC").where(:hasVideo => true)
   else 
      @cat = Category.find_by_category_name(@category)
      @user_list = @cat.users.order("points DESC")     
   end
else 
      @lead = Leaderboard.find_by_leaderboard_name(@leaderboard)
      @user_list = @lead.users.order("points DESC")
end 


respond_to do |format|
 format.js{}
end 

end

end
