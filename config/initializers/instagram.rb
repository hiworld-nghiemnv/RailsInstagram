require "instagram"

Instagram.configure do |config|
  config.client_id = "909cc760e99d46ffaedd002cb4184aa6"
  config.client_secret = "0c805791b68f49b09b9749710fb66a2b"
end

CALLBACK_URL = "http://localhost:3000/session/callback"
