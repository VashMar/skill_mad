module LeaderboardsHelper

def leaderboard_list(category)

@category = category 

if @category == nil
   Leaderboard.all 
else
  @leaderboards = Leaderboard.find_by_category_name(@category)
  if @leaderboards 
  @leaderboard_list = @leaderboards.collect{|l| [l.leaderboard_name]}
  else 
  @leaderboard_list = ["Empty"] 
  end
end
    
end


def selected_value(category) 
 @category = category 
 @category == nil ?  @selected_value = "" :  @selected_value = @category
end 
 



end
