ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "mail.gmail.com",
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => 'skillmadlab@gmail.com',
  :password             => '5k11110na1r3',
  :authentication       => 'plain',
  :enable_starttls_auto => true
  
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
require 'development_mail_interceptor'
ActionMailer::Base.register_interceptor( DevelopmentMailInterceptor ) if Rails.env.development?
