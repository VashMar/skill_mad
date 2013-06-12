class PasswordResetsController < ApplicationController
  
  

def create
  user = User.find_by_email(params[:email])
  if user
  user.send_password_reset 
  flash[:success] = "Email sent with password reset instructions"
  else 
  flash[:failure] = "That user does not exist"
  end 
  redirect_to home_url
end


def new
  
end


def edit
  @user = User.find_by_password_reset_token!(params[:id])
end




def update
  @user = User.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 2.hours.ago
    flash[:failure] = "That reset token has expired"
    redirect_to new_password_reset_path
  elsif @user.update_attributes(params[:user])
    flash[:success] = "Password has been reset"
    redirect_to home_url
  else
    render :edit
  end
end

def change_pass
    user = User.find(params[:id])
     if user && user.authenticate(params[:user][:password])	
        user.update_attribute(:password, params[:user][:new_password])
 	sign_in(user)
        flash[:success] = "Password Changed!"
 	render js: "window.location.pathname='#{home_path}'"
     else
	respond_to do |format|
 	  format.js{}
        end 
 
     end

	
end


end
