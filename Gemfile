source 'https://rubygems.org'

ruby ENV['CUSTOM_RUBY_VERSION'] || '2.4.1'

# Force HTTPS for GitHub under bundler 1.x, which is the default for bundler 2.x
git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'rails', "~> 5.0.1"

# Use Puma as the app server
gem 'puma', '~> 3.0'

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use Haml as a replacement for ERB view templates
gem 'haml-rails'

# Icon fonts
gem 'font-awesome-sass'

# PostgreSQL
gem 'pg'

# Autoprefixer
gem 'autoprefixer-rails'

# Job queueing with DelayedJob
gem 'delayed_job'
gem 'delayed_job_active_record'

# Form builder
gem 'simple_form'

# Server-side syntax highlighting
gem 'pygments.rb'

# Markdown parsing and rendering
gem 'redcarpet', '~> 3.3.4'

# OAuth integration
gem 'omniauth'
gem 'omniauth-google-oauth2'

# Full-text search with PostgreSQL
gem 'pg_search'

gem 'activemodel-serializers-xml'

# Decorators
gem 'draper', '3.0.0.pre1'

# Default responses from controllers
gem 'responders','~> 2.0'

# Friendly URL slugs for models
gem 'friendly_id'

# Environment variables from .env files
gem 'dotenv-rails'

# ActionCable dependency
gem 'redis', '~> 3.0'

gem 'font-awesome-sass'

# === Third-party Integrations === #

# Exception reporter (see orientation.yml)
gem 'bugsnag'

# Article activity Slack notifications
gem 'slack-notifier'

# Transactional emails (see orientation.yml)
gem 'mandrill_mailer'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'powder'
  gem 'bullet'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'derailed_benchmarks'
  gem 'stackprof'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-remote'
  gem 'awesome_print'
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'climate_control'

  # === Third-party integrations === #

  # Code Climate test coverage reporting
  gem 'codeclimate-test-reporter', require: nil
end

group :production, :staging do
  gem 'rails_12factor'
  gem 'rack-timeout'
  # platform-api fork is necessary to allow letsencrypt-rails-heroku to
  # make Heroku API requests to upload the Let's Encrypt SSL certificates
  gem 'platform-api', github: 'jalada/platform-api', branch: 'master'
  gem 'letsencrypt-rails-heroku', github: "olivierlacan/letsencrypt-rails-heroku", branch: "automiddleware"

  # == Third-party Integrations == #

  # Performance monitoring
  gem 'skylight'
end
