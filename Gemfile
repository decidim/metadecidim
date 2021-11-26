# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "0.25.2"

gem "decidim", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION
gem "decidim-consultations", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-term_customizer", { git: "https://github.com/AjuntamentdeBarcelona/decidim-module-term_customizer", branch: "feature/webpacker-migration" }

gem "omniauth-decidim", "0.2.1"

gem "faker"
gem "puma", ">= 4.3"
# geocoder can not be upgraded to 1.6 until the Here maps api key is changed for the new one
gem "geocoder", "~> 1.6.3"

gem "redis", "~> 4.2.2"

# Report GC usage data to StatsD with 'barnes' gem so that Heroku can monitor
gem "barnes"

group :development, :test do
  gem "byebug", platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem "rspec-rails"
end

group :development do
  gem "letter_opener_web"
  gem "listen", "~> 3.1.0"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
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
end
