source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.5'

gem 'bcrypt', '~> 3.1.7'
gem 'coffee-rails', '~> 4.1.0'
gem 'font-awesome-rails'
gem 'foundation-rails'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'kaminari'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'simple_form'
gem 'slim-rails'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :production, :staging, :qa do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug'
  gem 'capybara'
  gem 'capybara-email'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'letter_opener'
  gem 'poltergeist'
  gem 'pry-rails'
  gem 'puma'
  gem 'quiet_assets'
  gem 'rspec-rails'
  gem 'rspec-retry'
  gem 'simplecov', require: false
end

group :development do
  gem 'better_errors'
  gem 'bullet'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'traceroute'
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'codeclimate-test-reporter', require: nil
end
