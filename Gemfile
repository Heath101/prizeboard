source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.14'

group :assets do
  gem 'bootstrap-sass-rails'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'compass-rails'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'sqlite3', '1.3.8' 
  gem 'rspec-rails', '~> 2.0'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'childprocess'
  gem 'spork'
  gem 'factory_girl_rails', '~> 4.0'
end

group :test do
  gem 'capybara'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false
end

group :production do
  gem 'thin'
  gem 'pg', '0.12.2'
  gem 'rails_12factor'
end

gem 'jquery-rails'