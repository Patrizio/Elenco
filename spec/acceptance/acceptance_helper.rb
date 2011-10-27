require 'spec_helper'
require 'capybara/rails'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.default_driver = :selenium
