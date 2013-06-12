OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '522289751142278', 'f02dc5ce5a30218f8f81474c487e5233', :scope => 'email'
end
