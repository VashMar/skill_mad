require 'development_mail_interceptor'

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address              => "mail.skillmad.com",
  :port                 =>  26,
  :domain 		=> "www.skillmad.com",
  :user_name            => "welcome@skillmad.com",
  :password             => "welcome2skillmad",
  :authentication       => :login,
  :enable_starttls_auto => false
}

if Rails.env == "development"
   ActionMailer::Base.default_url_options = {:host => "localhost:3000"}
else
   ActionMailer::Base.default_url_options = {:host => "http://www.skillmad.com"}
end

   ActionMailer::Base.register_interceptor( DevelopmentMailInterceptor ) if Rails.env.development?
