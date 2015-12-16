require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara-screenshot/rspec'

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

DEFAULT_PORT = 9887

Capybara.javascript_driver = :poltergeist
Capybara.asset_host = 'http://localhost:3000'
Capybara.server_port = DEFAULT_PORT
Capybara.app_host = "http://lvh.me:#{Capybara.server_port}"
ActiveRecord::Migration.maintain_test_schema!
Capybara::Screenshot.prune_strategy = :keep_last_run
Capybara::Screenshot.autosave_on_failure = true

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods

  config.before :suite do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before :each do
    DatabaseCleaner.strategy = :transaction
  end

  config.before :each, js: true do
    DatabaseCleaner.strategy = :truncation, { pre_count: true }
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    begin
      DatabaseCleaner.clean
    rescue
      nil
    end
  end
end
