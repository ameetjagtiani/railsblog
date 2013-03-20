OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['628866630462359'], ENV['abaff571b6b6dda004ba802a216ad03f']
  #:scope => 'email,user_birthday,read_stream', :display => 'page'
  #:client_options => { :ssl => { :ca_file => "#{Rails.root}/config/ca-bundle.crt" } }  	
end
