# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

# DECIDIM_VERSION = { github: "decidim/decidim", branch: "release/0.29-stable" }
DECIDIM_VERSION = "0.30.0"

gem "decidim", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION

gem "omniauth-decidim", "0.2.1"

gem "faker"
gem "puma", ">= 4.3"
gem "geocoder", "~> 1.8.0"

gem "redis", "~> 4.7.0"

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
end

group :production do
  gem "aws-sdk-s3", require: false
  gem 'fog-aws'
  # security fix for excon gem, which is a fog-aws dependency
  gem 'excon', '>= 0.71.0'
  gem 'dalli'
  gem 'sendgrid-ruby'
  gem 'lograge'
  gem 'sentry-raven'
  gem 'sidekiq'
  gem 'rails_autoscale_agent'
  gem 'scout_apm'
  gem 'rexml'
end
