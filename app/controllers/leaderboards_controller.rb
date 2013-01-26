class LeaderboardsController < ApplicationController


def create 
LeaderBoard.build(params[:leaderboard])

end 




end
