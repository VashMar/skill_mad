class  FlagsController < ApplicationController 




def flag



  @flag = Flag.find_flag(params[:user], params[:video]) # find the flag with the current user and video 
  
  if !@flag.exists? 
     Flag.create(:user_id => params[:user], :video_id => params[:video])
     @video = Video.find(params[:video])
     @video.increment!(:flag_count)
    if @video.flag_count >= 10 
        UserMailer.flag_mail(@video.title, @video.user, @video.yt_video_id).deliver
    end
      flash[:success] = "Video flagged"
      redirect_to home_url 	
  else
     flash[:success] = "You have already flagged this video" 
     redirect_to home_url 
  end 

  
end 





















end 
