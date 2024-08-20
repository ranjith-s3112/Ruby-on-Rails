redis_connection = Redis.new(:host => ENV['REDIS_HOST'], :port => 6379, :driver => 'ruby')
$redis = Redis::Namespace.new(:sample_todo, redis: redis_connection)
