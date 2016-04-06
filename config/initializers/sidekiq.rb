require 'sidekiq'
require 'sidekiq/web'
require 'sidekiq_calculations'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == ["cigar city", "crossfit"]
end

Sidekiq.configure_client do |config|
  sidekiq_calculations = SidekiqCalculations.new
  sidekiq_calculations.raise_error_for_env!

  config.redis = {
    url: ENV['REDISTOGO_URL'],
    size: sidekiq_calculations.client_redis_size
  }
end

Sidekiq.configure_server do |config|
  sidekiq_calculations = SidekiqCalculations.new
  sidekiq_calculations.raise_error_for_env!

  config.options[:concurrency] = sidekiq_calculations.server_concurrency_size
  config.redis = {
    url: ENV['REDISTOGO_URL']
  }
end