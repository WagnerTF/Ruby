require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'ostruct'
require_relative 'helper.rb'
require_relative 'page_helper.rb'

BROWSER = ENV['BROWSER']
AMBIENTE = ENV['AMBIENTE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")
World(Capybara::DSL)
World(Helper)
World(Pages)

Capybara.register_driver :selenium do |app|
  
   if BROWSER.eql?('firefox')
    capabilities = Selenium::WebDriver::Remote::Capabilities.firefox
    driver = Selenium::WebDriver.for :firefox, capabilities: capabilities
  #  elsif BROWSER.eql?('chrome_headless')
  #    chrome_options = Selenium::WebDriver::Chrome::Options.new
  #    chrome_options.add_argument('--headless')
  #    chrome_options.add_argument('--disable-gpu')
  #    chrome_options.add_argument('--no-sandbox')
  #    chrome_options.add_argument('--disable-dev-shm-usage')
  
  #    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
    
   elsif BROWSER.eql?('firefox')
     Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette => true)
    
   elsif BROWSER.eql?('firefox_headless')
     browser_options = Selenium::WebDriver::Firefox::Options.new(args: ['--headless'])
     Capybara::Selenium::Driver.new(app, :browser => :firefox, options: browser_options)
   end
 end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG['url_padrao']
  config.default_max_wait_time = 10
end

