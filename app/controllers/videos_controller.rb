class VideosController < InheritedResources::Base
   
def upload
  
    @video = Video.create(params[:video])							# creates video 
  
    												# finds category 	
     if params[:leaderboard] != "Create New Leaderboard"                        	        # if the user isn't creating a new leaderboard   
        @lead = Leaderboard.find_by_leaderboard_name(params[:leaderboard])      	        # find existing leaderboard 
        @video.update_attributes(:leaderboard_id => @lead.id, :category_id => params[:category])  	# add the video to it and the category              
    else 
        @lead = Leaderboard.create(params[:new_board])						# create a new leaderboard with the passed in name and description 
        @lead.update_attribute(:category_id, params[:category])
        @video.update_attributes(:leaderboard_id => @lead.id, :category_id => params[:category])    
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
	  flash[:success] = "video successfully updated"
          redirect_to @video
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
     
      redirect_to submitted_url(:video_id => params[:id].to_s)
end


def edit_vid
 video = Video.find(params[:id])
 video.update_attributes(params[:video])
  

 respond_to do |format| 
  format.js{}
 end 
 
end 


def destroy
    @video = Video.find(params[:id])
    user = current_user
    owner = User.find(@video.user_id)  
    if  user.id == owner.id || user.admin?
       if Video.delete_video(@video)
 	 @deleted = true
         if owner.videos.empty?
          owner.update_attribute(:hasVideo, false)
	  sign_in(user)
          else
          sign_in(user)
          end 

         user.id == owner.id ? @videos = owner.video : @videos = Video.where("yt_video_id is not null")

       else
         @deleted = false 
       end 
    else 
      @deleted = false     
    end
    
   respond_to do |format|
    format.js{}
   end 
   
end

  def pre_upload
    @upload_info = Video.token_form(params[:video], home_path)
  end

def vid_swap

 @current_video = Video.find(params[:video])
 @bank = params[:bank]
 @board = params[:board]

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
 	 if params[:leaderboard] != nil && params[:leaderboard] != "All Leaderboards"
          @video_list = Leaderboard.find_by_leaderboard_name(params[:leaderboard]).videos.order("points DESC")
	  @board = "leaderboard"
          @bank = "#{params[:leaderboard]}'s Videos"
	 else 
          @video_list = Video.where("yt_video_id is not null").order("points DESC").limit(15)
          @bank = "Top Videos"
         end 
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


  def submitted 
  @video_id = params[:video_id]
  end 


  protected
    def collection
      @videos ||= end_of_association_chain.completes
    end
  
   
end
