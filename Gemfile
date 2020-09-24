# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/decidim/decidim", tag: "v0.22.0.rc2" }

gem "decidim", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION
gem "decidim-consultations", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
# Change dependency to ruby-gems after term-customizer is compatible with decidim >= 0.20
gem "decidim-term_customizer", git: "https://github.com/CodiTramuntana/decidim-module-term_customizer"
gem 'omniauth-decidim', git: 'https://github.com/decidim/omniauth-decidim'

gem "uglifier", ">= 1.3.0"

gem "faker", "~> 1.8.4"
gem "deface"
gem "puma", ">= 4.3"
# geocoder can not be upgraded to 1.6 until the Here maps api key is changed for the new one
gem "geocoder", "~> 1.6.3"

# Report GC usage data to StatsD with 'barnes' gem so that Heroku can monitor
gem "barnes"

group :development, :test do
  gem "byebug", platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem "rspec-rails"
end

group :development do
  gem "letter_opener_web", "~> 1.3.0"
  gem "listen", "~> 3.1.0"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console"
end

group :production do
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
