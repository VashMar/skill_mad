class VideosController < InheritedResources::Base
  

 
  def upload
    @video = Video.create(params[:video])
    if @video
      @upload_info = Video.token_form(params[:video], save_video_new_video_url(:video_id => @video.id))
    end
   
  end

  def update
    @video     = Video.find(params[:id])
    @result    = Video.update_video(@video, params[:video])
    respond_to do |format|
      format.html do
        if @result
          redirect_to @video, :notice => "video successfully updated"
        else
          respond_to do |format|
            format.html { render "/home" }
          end
        end
      end
    end
  end

 def save_video
     
    @video = Video.find(params[:video_id])
      @user = User.find(current_user.id)
      @video.update_attributes(:yt_video_id =>params[:id].to_s, :is_complete => true, :user_id => current_user.id) 
   if params[:status].to_i == 200
      Video.delete_incomplete_videos
   else
      Video.delete_video(@video)
   end
    @user.update_attribute(:hasVideo, true)
    sign_in(@user)
    
    redirect_to submitted_url
   end

  def destroy
    @video = Video.find(params[:id])
    if Video.delete_video(@video)
      flash[:notice] = "video successfully deleted"
    else
      flash[:error] = "video unsuccessfully deleted"
    end
    redirect_to videos_path
  end

  def pre_upload
    @upload_info = Video.token_form(params[:video], home_path)
  end

 def vid_swap

 @current_video = Video.find(params[:video])
 

	respond_to do |format|
	format.js{}	
	end
 end
 
 def vid_bank
  
   if params[:user_id] == nil
    @video_list = Video.order("points DESC").limit(15)
    @bank = "Top Videos"
   else 
    @user = User.find(params[:user_id])
    @video_list = @user.videos.order("points DESC")
    @bank = "#{@user.name}'s Videos" 
   end


   if params[:video] != nil
    @current_video = Video.find(params[:video])
   else 
    @current_video = @video_list[0]
   end

   if params[:myVid] != nil 
    @myVid = params[:myVid]
   end

   respond_to do |format|
     format.js{}
   end
 end


 def t
 @video = Video.find_by_yt_video_id(params[:video])
 redirect_to home_path(:video => @video)
 end 


 def u
 @video = Video.find_by_yt_video_id(params[:video])
 redirect_to home_path(:user_id => @video.user_id, :video => @video)
 end

  protected
    def collection
      @videos ||= end_of_association_chain.completes
    end
  
   
end
