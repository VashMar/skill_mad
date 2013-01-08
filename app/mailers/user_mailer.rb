class UserMailer < ActionMailer::Base
  
 def welcome_email(user)
    @user = user
    @url  = activate_account_url(@user.remember_token, :host => "localhost:3000" )  # switch for production
    mail(:to => user.email, :subject => "Welcome to Skillmad",  :from => "TheMadScientists@skillmad.com")
  end
end
