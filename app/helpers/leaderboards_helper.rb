module LeaderboardsHelper

def leaderboard_list(category)

@category = category 

if @category == nil
   Leaderboard.all 
end
end 



end
