source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '4.0.4'
# gem 'sass-rails', '~> 4.0.0'
# gem 'uglifier', '>= 1.3.0'
# gem 'coffee-rails', '~> 4.0.0'
# gem 'jquery-rails'
# gem 'turbolinks'
# gem 'jbuilder', '~> 1.2'
# gem 'rabl'
gem 'figaro'
# gem 'pg'
gem 'thin'
gem 'mini_portile', '0.5.2'
gem 'nokogiri', '1.6.1'
gem 'redis'
gem 'bcrypt', require: 'bcrypt'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_20]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
end

group :development, :test do
  # gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'byebug'
  gem 'faker'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'fakeredis'
end

group :production do
  gem 'rails_12factor', '0.0.2'
  gem 'unicorn'
end
