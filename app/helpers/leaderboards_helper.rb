module LeaderboardsHelper

def leaderboard_list(category)

@category = category 

if @category == nil
   Leaderboard.all.collect{|l| [l.leaderboard_name]}
else
  @category = Category.find_by_category_name(@category)
  @leaderboards = @category.leaderboards 
  if !@leaderboards.empty? 
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
