# Capster it's Capybara Tester custom helper class
require 'capybara/poltergeist'

class Capster
  include Capybara::DSL
  Capybara.default_max_wait_time = 8

  attr_reader :session

  def initialize
    @session = Capybara::Session.new(:poltergeist)
  end

  def self.session
    new.session
  end
end
