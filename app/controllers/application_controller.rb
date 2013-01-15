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

end
