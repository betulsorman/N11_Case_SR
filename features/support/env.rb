require 'capybara'
require 'capybara/dsl'
require 'rspec'
require 'selenium-webdriver'
require 'date'
require 'time'
require 'allure-cucumber'

include Capybara::DSL
include RSpec::Matchers

RSpec.configure do |config|
  config.include Capybara::DSL, type: :feature
end

require_relative '../config/base_config'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_selector = :css
  config.default_max_wait_time = 10
  config.default_normalize_ws = true
end

Dir["#{Dir.pwd}/features/utils/*.rb"].each do |file_path|
  require_relative file_path
end

