require 'sidekiq'
require 'sidekiq/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == ["cigar city", "crossfit"]
end

Sidekiq.configure_client do |config|
  config.redis = { :size => 1 }
end
