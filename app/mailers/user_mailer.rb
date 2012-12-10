class UserMailer < ActionMailer::Base
  default :from => "TheMadScientists@skillmad.com"
  
  def welcome_email(user)
    @user = user
    @url  = activate_account_url(@user.remember_token, :host => "localhost:3000")  # switch for production
    mail(:to => user.email, :subject => "Welcome to Skillmad")
  end
end
