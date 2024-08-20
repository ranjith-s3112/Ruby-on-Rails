require 'sidekiq'
require 'sidekiq/web'
# require 'sidekiq-scheduler'
# require 'sidekiq-scheduler/web'

Sidekiq::DelayExtensions.enable_delay!
Sidekiq.configure_server do |config|
  config.redis = {
  host: ENV['REDIS_HOST'],
  port: ENV['REDIS_PORT'] || '6379'
  }
  # config.on(:startup) do
  #   Sidekiq::Scheduler.dynamic = true
  #   Sidekiq.schedule = YAML.load_file(File.expand_path('../../sidekiq_scheduler.yml', __FILE__))
  #   SidekiqScheduler::Scheduler.reload_schedule!
  # end
end
Sidekiq.configure_client do |config|
  config.redis = {
  host: ENV['REDIS_HOST'],
  port: ENV['REDIS_PORT'] || '6379'
  }
end
