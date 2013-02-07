class PasswordResetsController < ApplicationController
  
  

def create
  user = User.find_by_email(params[:email])
  if user
  user.send_password_reset 
  flash[:success] = "Email sent with password reset instructions."
  else 
  flash[:failure] = "That user does not exist."
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
    redirect_to new_password_reset_path, :failure => "Password &crarr; 
      reset has expired."
  elsif @user.update_attributes(params[:user])
    redirect_to home_url, :success => "Password has been reset."
  else
    render :edit
  end
end




end
