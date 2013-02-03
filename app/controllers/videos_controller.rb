class VideosController < InheritedResources::Base
   


 
  def upload
  
    @video = Video.create(params[:video])				# creates video 
    leadncat = params[:leaderboard].split(',')                          # splits leaderboard name and category name
    @cat = Category.find_by_category_name(leadncat[1])			# finds category 	
     if leadncat[0] != "Create New Leaderboard"                         # if the user isn't creating a new leaderboard   
        @lead = Leaderboard.find_by_leaderboard_name(leadncat[0])       # find existing leaderboard 
        @video.update_attribute(:leaderboard_id, @lead.id)              # add the video to it 
        @video.update_attribute(:category_id, @cat.id)                  # also add the video to that category 
     else 
                                                                        # create a new leaderboard with the passed in name and description 
        @lead = Leaderboard.create(params[:new_board])
        @lead.update_attribute(:category_id, @cat.id) 
        @video.update_attribute(:category_id, @cat.id) 
        @video.update_attribute(:leaderboard_id, @lead.id) 
     end 
     
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
    if current_user.id == @video.user_id 
       if Video.delete_video(@video)
       flash[:success] = "video successfully deleted"
       else
       flash[:failure] = "video deletion unsuccessful"
       end 
    else 
     flash[:failure] = "Stop trying to delete other people's videos"    
    end
    redirect_to home_url
  end

  def pre_upload
    @upload_info = Video.token_form(params[:video], home_path)
  end

 def vid_swap

 @current_video = Video.find(params[:video])
 @bank = params[:bank]

	respond_to do |format|
	format.js{}	
	end
 end
 
 def vid_bank
  
    if params[:user_id] == nil
       if params[:new] != nil
         @video_list = Video.where("yt_video_id is not null").order("created_at DESC")
         @bank = "New Videos"  
       else
         @video_list = Video.where("yt_video_id is not null").order("points DESC").limit(15)
         @bank = "Top Videos"
       end
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
   else 
    @new = true 
   end

  

   respond_to do |format|
     format.js{}
   end
 end


 def flush_junk
   junk = Video.where(:yt_video_id => nil)
    
    junk.each do |vid|
     t = Time.now.to_i - vid.updated_at.to_i 
      if t >= 400
        vid.delete 
      end
     end 
  
   Leaderboard.all.each do |lead|

   if lead.videos.empty?
         lead.delete 
   end 

   end 
  

    
   redirect_to home_url 
 end 


  protected
    def collection
      @videos ||= end_of_association_chain.completes
    end
  
   
end
