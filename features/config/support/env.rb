require 'bundler/setup'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'capybara/poltergeist'
require 'faker'
require 'rest-client'
require 'rubygems'
require 'selenium-webdriver'
require 'site_prism'
require 'base64'
require 'yaml'
require_relative '../../../features/config/support/helpers/step_helpers'

World(PageObjects)

require_relative '../../config/support/matchers/be_displayed'

$root_path = __FILE__.rpartition("features")[0]

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = (ENV['DRIVER'] || 'selenium').to_sym
  config.default_selector = :css
  config.default_max_wait_time = 10
end

Capybara.register_driver :poltergeist do |app|
  options = {
      js_errors: true,
      timeout: 120,
      debug: false,
      phantomjs_options: ['--load-images=no', '--disk-cache=false'],
      inspector: true

  }

  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_option("useAutomationExtension", false)
  options.add_argument("--window-size=1920,1080")
  options.add_argument("--start-maximized")
  Capybara::Selenium::Driver.new(app, browser: :chrome, switches: ['--incognito', '--disable-extensions', '--disable-infobars'], options: options)
end

Capybara.register_driver :chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_option("useAutomationExtension", false)
  options.add_argument("--window-size=1920,1080")
  options.add_argument("--headless")
  Capybara::Selenium::Driver.new(app, browser: :chrome, switches: ['--incognito', '--disable-extensions', '--disable-infobars'], options: options)
end

Capybara.register_driver :ie do |app|
  Capybara::Selenium::Driver.new(app, browser: :ie)
end

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

SitePrism.configure do |config|
  config.use_implicit_waits = true
end

Capybara::Screenshot.register_driver(Capybara.current_driver) do |driver, path|
  driver.browser.save_screenshot path
end

Capybara::Screenshot::RSpec::REPORTERS["RSpec::Core::Formatters::HtmlFormatter"] = Capybara::Screenshot::RSpec::HtmlEmbedReporter
Capybara.save_path = "features/config/screenshots/"
Capybara::Screenshot.prune_strategy = :keep_last_run
Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
  "screenshot_#{example.description.gsub(' ', '-').gsub(/^.*\/spec\//, '')}"
end