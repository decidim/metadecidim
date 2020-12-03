# WARN: The API GraphQl fails in development when Puma is configured with workers. Making comments failing to load.
# The solution is to comment the line where the workers are defined
# The error stacktrace is:
# GraphQL::Schema::InvalidTypeError (Query is invalid: Query must define at least 1 field. 0 defined.)
workers Integer(ENV['WEB_CONCURRENCY'] || 2) if (ENV['RACK_ENV'] || ENV['RAILS_ENV']) == 'production'
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end

# Enable Heroku Ruby Metrics: https://devcenter.heroku.com/articles/language-runtime-metrics-ruby#getting-started
require 'barnes'
before_fork do
  # worker specific setup

  Barnes.start # Must have enabled worker mode for this to block to be called
end
