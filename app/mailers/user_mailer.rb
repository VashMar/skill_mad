class UserMailer < ActionMailer::Base
 default :from => "TheExperts@skillmad.com"
 
 def welcome_email(user)
     @user = user
     @url  = activate_account_url(:token => @user.remember_token)
     mail(:to => @user.email, :subject => "Welcome to Skillmad")
  end

 def password_reset(user)
  @user = user  
  mail(:to => @user.email , :subject => "Someone partied too hard and forgot their password..")
 end 


 def contact_email(email, message)
     @email = email
     @message = message
     mail(:to => "management@skillmad.com", :subject =>  "Message from SkillMad User:  #{@email}")
 end

end
