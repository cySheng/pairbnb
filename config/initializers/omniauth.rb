Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, ENV['facebook_key'], ENV['facebook_key_secret'],
 scope: 'email,public_profile'
 
end