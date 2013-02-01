module LeaderboardsHelper

def leaderboard_list(category)

@category = category

@leaderboard_list = @category.leaderboards 
    
end




def selected_value(category) 
    @category = category 
    @category == nil ?  @selected_value = "" :  @selected_value = @category
end 
 



end
