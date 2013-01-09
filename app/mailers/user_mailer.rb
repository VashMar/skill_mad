class UserMailer < ActionMailer::Base
  
 def welcome_email(user)
    @user = user
    @url  = activate_account_url(@user.remember_token)
    mail(:to => @user.email, :subject => "Welcome to Skillmad", :from => "welcome@skillmad.com")
  end
end
