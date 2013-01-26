module LeaderboardsHelper

def leaderboard_list(category)

@category = category 

if @category == nil
   Leaderboard.all 
else
  @leaderboards = Leaderboard.find_by_category_name(@category.category_name)
  @leaderboard_list = @leaderboards.collect{|l| [l.leaderboard_name]}
end
    
end

 



end
