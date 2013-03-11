class CategoriesController < ApplicationController

def show
end

def new
end 

def swap
end

def leaderboards
if params[:category] != ""
@cat = Category.find(params[:category])
@leaderboard_list = @cat.leaderboards.collect{|l| [l.leaderboard_name]}
@leaderboard_list << ["Create New Leaderboard"]
else
@leaderboard_list = "none"
end 

respond_to do |format|
  format.js{}
end

end 


end 
