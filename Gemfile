source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.6"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

gem "rails-i18n"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem "bootstrap", "~> 5.2"
gem "devise"
gem 'pundit'
gem "autoprefixer-rails"
gem "font-awesome-sass", "~> 6.1"
gem "simple_form", github: "heartcombo/simple_form"
gem 'slim-rails'
gem 'will_paginate'
gem 'will_paginate-bootstrap'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "dotenv-rails"
  gem 'rubocop', require: false
  gem 'webdrivers', '>= 4.8.0'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem 'database_cleaner'
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara-selenium' # MIT-License
  gem 'capybara-slow_finder_errors' # MIT-License
  gem 'cucumber-rails', require: false # MIT-License
  gem 'database_cleaner-active_record' # MIT-License
  gem 'factory_bot_rails' # MIT-License
  gem 'faker' # MIT-License
  gem 'rspec-rails' # MIT-License
  gem 'rspec-mocks' # MIT-License
  gem 'rspec-core' # MIT-License
  gem 'selenium-webdriver' # Adds support for Capybara system testing and selenium driver
  gem 'shoulda-matchers' # Adds validation matchers - MIT License
  gem 'simplecov' # MIT-License
  gem 'simplecov-lcov' # MIT-License
  gem 'spring-commands-rspec' # MIT-License
  gem 'undercover' # MIT-License
  gem 'webmock' # MIT-License
end
