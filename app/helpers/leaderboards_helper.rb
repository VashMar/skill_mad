module LeaderboardsHelper

def leaderboard_list(category)

@category = category

@leaderboard_list = @category.leaderboards.map {|l| l.leaderboard_name}.uniq
@leaderboard_list << "Create New Leaderboard" 
    
end




def selected_value(category) 
    @category = category 
    @category == nil ?  @selected_value = "" :  @selected_value = @category
end 
 



end
