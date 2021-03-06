class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  helper :all
  helper_method :yt_client
  
  def yt_client
    @yt_client ||= YouTubeIt::Client.new(:username => YouTubeITConfig.username , :password => YouTubeITConfig.password , :dev_key => YouTubeITConfig.dev_key)
  end
  
  def request_leaderboard
      UserMailer.leaderboard_email(params[:leaderboard_name], params[:leaderboard_description]).deliver
      flash[:success]= "Thank's for adding to the madness! We'll be in touch." 
      redirect_to home_url
  end

 def contact_email
     UserMailer.contact_email(params[:contact_email], params[:contact_message]).deliver
     flash[:success]= "Message recieved, we will get back to you shortly!"
     redirect_to home_url
 end

 def settings_page
    render 'layouts/settings' 
 end 

 def about_page
   render 'layouts/about'
 end

 def settings_swap
 
 @setting = params[:setting]

 if @setting == "manage_videos"
    user = User.find(params[:id])
    if user.admin?
       @videos = Video.where("yt_video_id is not null")
    else
       @videos = user.videos 
    end 
 end 
   
  respond_to do |format|
   format.js{}
  end   
 end 

end
