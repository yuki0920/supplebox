# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '6.1.1'

gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use ActiveModel has_secure_password
gem 'bcrypt'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'listen'
  gem 'rubocop-rails'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'committee-rails'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'brakeman'
  gem 'chromedriver-helper'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov', require: false
end

group :production do
  gem 'fog-aws'
  gem 'google-analytics-rails'
end

gem 'active_model_serializers', '~> 0.10.0'
gem 'aws-sdk'
gem 'bootstrap', '< 5.0'
gem 'carrierwave'
gem 'dotenv-rails'
gem 'factory_bot_rails'
gem 'faker'
gem 'gretel'
gem 'haml-rails'
gem 'jb'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'meta-tags'
gem 'mini_magick'
gem 'ransack'
gem 'sitemap_generator'
gem 'vacuum'
gem 'webpacker'
