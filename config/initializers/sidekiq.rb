require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { size: ENV['SIDEKIQ_CLIENT'].to_i }
end

Sidekiq.configure_server do |config|
  config.redis = { size: ENV['SIDEKIQ_SERVER'].to_i }
end
