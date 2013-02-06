class LeaderboardsController < ApplicationController


def create 

end 


def video_board


@category = params[:category]
@leaderboard = params[:leaderboard] 
 
if @leaderboard == "All Leaderboards" || @leaderboard == nil
   if params[:category] == "All Categories"
       @videos = Video.paginate :page => 1, :order => 'points DESC', :per_page => 5
   else 
        @cat = Category.find_by_category_name(params[:category])
        @videos = Video.find_in_cat(@cat.id).order("points DESC")
   end
else 
    @leaders = Leaderboard.find_by_leaderboard_name(params[:leaderboard])
    @description = @leaders.leaderboard_description 
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
      @board_id = @lead.id 
      @user_list = @lead.users.order("points DESC")
end 


respond_to do |format|
 format.js{}
end 

end

end
