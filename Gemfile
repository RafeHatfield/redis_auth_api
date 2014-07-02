source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '4.0.4'
gem 'figaro'
gem 'thin'
gem 'mini_portile', '0.5.2'
gem 'nokogiri', '1.6.1'
gem 'redis'
gem 'bcrypt', require: 'bcrypt'
gem 'rack-rewrite'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_20]
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'byebug'
  gem 'faker'
end

group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'fakeredis'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end
