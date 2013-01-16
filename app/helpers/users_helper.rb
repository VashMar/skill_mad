module UsersHelper

def up_user_points
    self.update_column(:points, self.points + 1)
end

def down_user_points
    User.decrement_counter(:points, current_video.user)
end


def user_video_title(user, num)
    @user = user
    @user.videos.order("points DESC")[num].title
end

def user_video_points(user,num)
    @user = user
    @user.videos.order("points DESC")[num].points
end

  
def user_vid_id(user, num)
    @user = user
    @id = @user.videos.order("points DESC")[num].id
end

def users_with_video
    @user_list = User.all
    users_with_videos = Array.new
 
    @user_list.each do |user|
      if user.videos != nil then users_with_videos.push user end
    end
    users_with_videos.order("points ASC")
end

def select_user(user)
    @selected_user = user 
end

def selected_user
    @selected_user ||= User.all[0]
end

def hasVid?(user)
    if user == nil
      false
    else
      @user = user
      @user.hasVideo == true ?  true : false
    end
end 

def user_yt_id(user, num)
    @user = user
    @vid = @user.videos.order("points DESC")[num]
    @youtubeid = @vid.yt_video_id
end

def user_rep(user)

@user = user 

@points = @user.points 
case @points 
when 0
"A nobody"
when 1...25
"Keg Filler"
when 26...50
"Life of the Party"
when 51...75
"About to blow up"
when 75...300
"Made it"
when 300..500
"Mastered it"
else
"Madtowns Finest"
end 
end



end				 
