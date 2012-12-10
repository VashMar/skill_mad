 class SessionsController < ApplicationController
  
def new
  
end

def create

  user = User.find_by_email(params[:session][:email])
  if user.activated?
  if user && user.authenticate(params[:session][:password])
    sign_in(user)
    redirect_to home_path
  end
  else
  link =  "<a \href=http://www.wiscmail.wisc.edu\"> Wiscmail</a>"   
  flash[:failure] ="This account is not yet active, check your #{link}".html_safe
    redirect_to home_path
  end
end

def destroy
 
  sign_out
  redirect_to home_path
end

def verify
   user = User.find_by_email(params[:session][:email])
   if user && user.authenticate(params[:session][:password])
    respond_to do |format| 
       format.json{render :json => true}
    end
  else
     respond_to do |format| 
       format.json{render :json => false}
     end
     end
end

def activate_account(token)
  user = User.find_by_remember_token(token)
  
  if user.activated?
    flash[:notice] = "Account is already active"
    redirect_to home_path
  else
    user.update_attribute(:activated, true)
    sign_in(user)
    redirect_to home_path
  end
end

end
