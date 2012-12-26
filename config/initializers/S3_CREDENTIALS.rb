if Rails.env == "production" 
   S3_CREDENTIALS = { :access_key_id => ENV['AKIAJH6FJ3EDG5LGKNZAY'], :secret_access_key => ENV['ThkDQegQeEJRX8vdSmk4P7EvyU38d53r73NNVCSX'], :bucket => "skilmadavatars"} 
 else 
   S3_CREDENTIALS = Rails.root.join("config/s3.yml")
end
