# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

gem "decidim", "0.8.3"

# Uncomment the following line if you want to use decidim-assemblies plugin
gem "decidim-assemblies"
gem "decidim-debates", git: "https://github.com/AjuntamentdeBarcelona/decidim-barcelona"
gem "decidim-initiatives", git: "https://github.com/decidim/decidim-initiatives"
gem "decidim-sortitions", git: "https://github.com/decidim/decidim-module-sortitions"

gem "puma", "~> 3.0"
gem "uglifier", ">= 1.3.0"

gem "faker", "~> 1.8.4"

group :development, :test do
  gem "byebug", platform: :mri

  gem "decidim-dev"
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
  gem 'dalli'
  gem 'sendgrid-ruby'
  gem 'newrelic_rpm'
  gem 'lograge'
  gem 'sentry-raven'
  gem 'sidekiq'
  gem 'rails_autoscale_agent'
end
