class UserMailer < ActionMailer::Base
  
 def welcome_email(user)
     @user = user
     @url  = activate_account_url(:token => @user.remember_token)
     mail(:to => @user.email, :subject => "Welcome to Skillmad", :from => "welcome@skillmad.com")
  end

 def leaderboard_email(name, description)
     @name = name 
     @description = description 
     mail(:to => "management@skillmad.com", :subject => "Leaderboard Request", :from => "welcome@skillmad.com")
 end

 def contact_email(email, message)
     @email = email
     @message = message
     mail(:to => "management@skillmad.com", :subject =>  "Message from SkillMad User:  #{@email} ", :from => "welcome@skillmad.com")
 end

end
