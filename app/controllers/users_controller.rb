class UsersController < ApplicationController

def new
end
  
def create
    @user = User.new(params[:user])
     if @user.valid? 
        @user.save  
        UserMailer.welcome_email(@user).deliver
        link= "<a href=http://www.wiscmail.wisc.edu> Wiscmail </a>"   
        flash[:success]= "This account is not yet active, check your #{link}".html_safe
        flash[:success]= "Your account has been made! Go check your #{link}!".html_safe
        redirect_to home_url
    else 
        flash[:failure] = "Account is invalid"
        redirect_to home_url
    end
end
  
def show
    @user = User.find(params[:id])
end

def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user]) 
    sign_in(@user)
    redirect_to home_url
end 

def prof_update
   @user = User.find(params[:id])
   if @user.update_attributes(params[:user])
      @valid = true
   else
      @valid = false 
   end
  
  sign_in(@user)
    respond_to do |format|
     format.js{}
    end
end 
 
def index

    @user_id = params[:user_id] 


    if params[:video] != nil
       @current_video = Video.find_by_yt_video_id(params[:video])
       params[:u] == true ? @user_id = @current_video.user_id : @user_id = nil
    end

    if @user_id == nil   # display top videos in scroll
      @video_list = Video.order("points DESC").limit(15)
      @myVid = false
      @bank = "Top Videos"
    else
      @user = User.find(@user_id) # display video bank in scroll
      @myVid = true 
      @video_list = @user.videos 
      @bank = "#{@user.name}'s Videos"
    end 
    params[:category] ? @category = params[:category] : @category = nil
    
    if @category 
       @cat_obj = Category.find_by_category_name(@category)
       @cat_videos = Video.find_in_cat(@cat_obj.id)
    end 

      @user_list = User.order("points DESC").where(:hasVideo => true)
      @new = false 
  respond_to do |format|
   format.js{}
   format.html{}
   end 
     
     
end
  
def check_email
 
    @user= User.find_by_email(params[:user][:email])
    respond_to do |format|
      format.json{render :json => !@user}
    end
     
end
  
def check_name
   @user= User.find_by_name(params[:user][:name])

   respond_to do |format|
     format.json{render :json => !@user}
   end

end
  
def select_user
 
 if params[:user] != nil
   @selected_user = User.find(params[:user])
 else
  @users = User.where(:hasVideo => true).order("points DESC")
  num = params[:number].to_i
  @selected_user = @users[num]
 end

 respond_to do |format|
    format.js{}
 end

end


end
