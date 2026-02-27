# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

#DECIDIM_VERSION = { github: "decidim/decidim", branch: "fix/user-groups", ref: "0a8f1218f6" }
DECIDIM_VERSION = "0.31.2"

gem "decidim", DECIDIM_VERSION
gem "decidim-core", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-elections", DECIDIM_VERSION
gem 'decidim-collaborative_texts', DECIDIM_VERSION

gem "omniauth-decidim", "0.2.1"

gem "faker"
gem "puma", ">= 4.3"
gem "geocoder", "~> 1.8.0"
gem "redis", "~> 4.7.0"
gem "i18n-tasks", "~> 0.9.37"

# Report GC usage data to StatsD with 'barnes' gem so that Heroku can monitor
gem "barnes"

# See https://github.com/decidim/metadecidim/pull/130
gem "wkhtmltopdf-binary", "0.12.6.6"

group :development, :test do
  gem "byebug", platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem "rspec-rails"
end

group :development do
  gem "letter_opener_web"
  gem "listen", "~> 3.7.1"
  gem "web-console"

  gem "capistrano"
  gem "capistrano3-puma", "~> 6.0"
  gem "capistrano-bundler"
  gem "capistrano-passenger"
  gem "capistrano-rails"
  gem "capistrano-rails-console"
  gem "capistrano-rbenv"
  gem "capistrano-sidekiq"
end

group :production do
  gem "appsignal"
  gem "aws-sdk-s3", require: false
  gem 'fog-aws'
  # security fix for excon gem, which is a fog-aws dependency
  gem 'excon', '>= 0.71.0'
  gem 'dalli'
  gem 'sendgrid-ruby'
  gem 'lograge'
  gem 'sidekiq'
  gem 'rails_autoscale_agent'
  gem 'rexml'
  gem "whenever", require: false
end
